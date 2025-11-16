#!/bin/bash
set -e

echo "=== BeforeInstall: stopping gunicorn if running ==="
systemctl stop gunicorn || true
