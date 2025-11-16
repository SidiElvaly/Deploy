#!/bin/bash
set -e

APP_DIR=/var/www/your-app

echo "=== ApplicationStart: install and start gunicorn service ==="
cp $APP_DIR/deploy/gunicorn.service /etc/systemd/system/gunicorn.service

systemctl daemon-reload
systemctl enable gunicorn
systemctl restart gunicorn

echo "ApplicationStart done."
