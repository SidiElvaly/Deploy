import React, { useEffect, useState } from "react";

function App() {
  const [message, setMessage] = useState("Loading...");

  useEffect(() => {
    // IMPORTANT: relative URL, same origin as the page
    fetch("/api/hello/")
      .then((res) => {
        if (!res.ok) {
          throw new Error(`HTTP ${res.status}`);
        }
        return res.json();
      })
      .then((data) => {
        setMessage(data.message || JSON.stringify(data));
      })
      .catch((err) => {
        console.error("Error calling API:", err);
        setMessage("Error calling API");
      });
  }, []);

  return (
    <div style={{ padding: "2rem", fontFamily: "sans-serif" }}>
      <h1>React + Django Test App</h1>
      <p>API response: {message}</p>
    </div>
  );
}

export default App;
