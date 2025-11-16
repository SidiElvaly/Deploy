import { useEffect, useState } from "react";

function App() {
  const [message, setMessage] = useState("Loading...");

  useEffect(() => {
    fetch("http://localhost:8000/api/hello/")
      .then((res) => res.json())
      .then((data) => setMessage(data.message))
      .catch((err) => {
        console.error(err);
        setMessage("Error calling API");
      });
  }, []);

  return (
    <div style={{ fontFamily: "sans-serif", padding: "2rem" }}>
      <h1>React + Django Test App</h1>
      <p>API response: {message}</p>
    </div>
  );
}

export default App;
