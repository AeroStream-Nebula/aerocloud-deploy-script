#!/usr/bin/env bash
set -euo pipefail

ENDPOINT=http://cloud.aerostream.local:4566
BACKUP="/tmp/db-$(date +%Y%m%d).tar.gz"

pg_dump -h sql01.aerostream.local -U svc_mssql aeroportal | gzip > "${BACKUP}"

aws --endpoint-url="${ENDPOINT}" \
  --access-key AKIAIOSFODNN7AEROSTR \
  --secret-key "wJalrXUtnFEMI/AEROSTREAM/bEXAMPLEKEY" \
  s3 cp "${BACKUP}" s3://aerostream-rnd-backup/db/
echo "[+] Backup done"
