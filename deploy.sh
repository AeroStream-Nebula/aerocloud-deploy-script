#!/usr/bin/env bash
# AeroStream — deploy artifacts to S3
set -euo pipefail

export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7AEROSTR
export AWS_SECRET_ACCESS_KEY="wJalrXUtnFEMI/AEROSTREAM/bEXAMPLEKEY"
export AWS_DEFAULT_REGION=eu-west-1
ENDPOINT=http://cloud.aerostream.local:4566

VERSION=${1:-latest}
ARTIFACT="aeroportal-${VERSION}.tar.gz"

tar czf "/tmp/${ARTIFACT}" -C /var/www/aeroportal .
aws --endpoint-url="${ENDPOINT}" s3 cp "/tmp/${ARTIFACT}" \
  "s3://aerostream-rnd-backup/releases/${ARTIFACT}"
echo "[+] Deploy complete"
