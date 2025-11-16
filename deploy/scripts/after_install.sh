#!/bin/bash
set -e

APP_DIR=/var/www/your-app

echo "=== AfterInstall: create/update virtualenv and install dependencies ==="
cd $APP_DIR

# Create venv if it does not exist
if [ ! -d "venv" ]; then
  echo "Creating virtualenv..."
  python3 -m venv venv
fi

source venv/bin/activate

echo "Upgrading pip and installing backend requirements..."
pip install --upgrade pip
pip install -r backend/requirements.txt

echo "Running Django migrations..."
cd $APP_DIR/backend
python manage.py migrate --noinput

echo "AfterInstall done."
