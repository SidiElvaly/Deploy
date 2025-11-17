#!/bin/bash
set -euo pipefail
set -x

APP_DIR=/var/www/your-app
PYTHON_BIN=python3.11

echo "=== AfterInstall: create/update virtualenv and install dependencies ==="

cd "$APP_DIR"

echo "=== Ensure python3.11 is installed ==="
if ! command -v "$PYTHON_BIN" >/dev/null 2>&1; then
  # Install if missing (Amazon Linux 2023)
  dnf install -y python3.11 python3.11-pip
fi

echo "=== Recreate virtualenv with python3.11 ==="
rm -rf venv
"$PYTHON_BIN" -m venv venv

# Activate venv
source venv/bin/activate

echo "Upgrading pip and installing backend requirements..."
pip install --upgrade pip
pip install -r backend/requirements.txt

echo "=== Run Django migrations ==="
cd "$APP_DIR/backend"
python manage.py migrate --noinput

echo "=== AfterInstall finished successfully ==="
