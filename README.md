# aerocloud-deploy-scripts

Internal CI/CD deployment scripts for AeroStream Industries cloud infrastructure.

## Usage

```bash
source .env
bash deploy.sh v1.2.3
```

Scripts require AWS credentials — see `.env.example`.

**Do not share this repository externally.**

## Scripts

- `deploy.sh` — Deploy artifacts to S3
- `scripts/backup-db.sh` — Nightly DB backup
- `scripts/sync-assets.sh` — Sync static assets

## Maintainer

ops@aerostream.local
