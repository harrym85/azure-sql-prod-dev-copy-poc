#!/usr/bin/env bash

set -euo pipefail

echo "=========================================="
echo " Azure SQL PROD -> DEV Database Copy"
echo "=========================================="

: "${DEV_SQL_SERVER:?DEV_SQL_SERVER is required}"
: "${SQL_COPY_USER:?SQL_COPY_USER is required}"
: "${SQL_COPY_PASSWORD:?SQL_COPY_PASSWORD is required}"

echo "Target server: ${DEV_SQL_SERVER}"
echo "Target database: DemoProdDB-Dev"
echo "Starting cross-subscription database copy..."

sqlcmd \
  -S "${DEV_SQL_SERVER}" \
  -d master \
  -U "${SQL_COPY_USER}" \
  -P "${SQL_COPY_PASSWORD}" \
  -C \
  -i sql/02-copy-database.sql \
  -b

echo "Database copy request submitted successfully."
