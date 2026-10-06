#!/usr/bin/env bash

set -euo pipefail

: "${DEV_SQL_SERVER:?DEV_SQL_SERVER is required}"
: "${SQL_COPY_USER:?SQL_COPY_USER is required}"
: "${SQL_COPY_PASSWORD:?SQL_COPY_PASSWORD is required}"

DATABASE_NAME="DemoProdDB-Dev"
MAX_ATTEMPTS=30
SLEEP_SECONDS=20

echo "Waiting for ${DATABASE_NAME} to become ONLINE..."

for ((attempt=1; attempt<=MAX_ATTEMPTS; attempt++)); do

    STATUS=$(sqlcmd \
      -S "${DEV_SQL_SERVER}" \
      -d master \
      -U "${SQL_COPY_USER}" \
      -P "${SQL_COPY_PASSWORD}" \
      -C \
      -h -1 \
      -W \
      -Q "SET NOCOUNT ON; SELECT state_desc FROM sys.databases WHERE name='${DATABASE_NAME}';" \
      | tr -d '\r' \
      | xargs)

    echo "Attempt ${attempt}/${MAX_ATTEMPTS}: ${STATUS:-NOT FOUND}"

    if [[ "${STATUS}" == "ONLINE" ]]; then
        echo "Database ${DATABASE_NAME} is ONLINE."
        exit 0
    fi

    sleep "${SLEEP_SECONDS}"
done

echo "ERROR: ${DATABASE_NAME} did not become ONLINE within the expected time."
exit 1
