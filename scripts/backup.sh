#!/bin/bash

# .env ファイルを読み込み
if [ -f ../.env ]; then
  source ../.env
else
  echo ".env ファイルが見つかりません"
  exit 1
fi

docker exec "$POSTGRE_CONTAINER" pg_dump -U "$POSTGRE_USER" -d "$POSTGRE_DB" > "$DUMP_DIR"
