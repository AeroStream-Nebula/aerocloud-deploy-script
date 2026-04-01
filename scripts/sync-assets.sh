#!/usr/bin/env bash
set -euo pipefail
ENDPOINT=http://cloud.aerostream.local:4566
aws --endpoint-url="${ENDPOINT}" s3 sync \
  /var/www/aeroportal/public/ s3://aerostream-public-website/ --acl public-read
echo "[+] Assets synced"
