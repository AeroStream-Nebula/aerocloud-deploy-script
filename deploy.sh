#!/usr/bin/env bash
# AeroStream — deploy artifacts to S3
set -euo pipefail

: "${AWS_ACCESS_KEY_ID:?not set — source .env first}"
: "${AWS_SECRET_ACCESS_KEY:?not set — source .env first}"
: "${ENDPOINT:=http://cloud.aerostream.local:4566}"

VERSION=${1:-latest}
ARTIFACT="aeroportal-${VERSION}.tar.gz"
tar czf "/tmp/${ARTIFACT}" -C /var/www/aeroportal .
aws --endpoint-url="${ENDPOINT}" s3 cp "/tmp/${ARTIFACT}" \
  "s3://aerostream-rnd-backup/releases/${ARTIFACT}"
echo "[+] Deploy complete"
