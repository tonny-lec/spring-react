#!/bin/bash

# .env ファイルを読み込み
if [ -f ../.env ]; then
  source ../.env
else
  echo ".env ファイルが見つかりません"
  exit 1
fi

cat "$DUMP_DIR" | docker exec -i "$POSTGRE_CONTAINER" psql -U "$POSTGRE_USER" -d "$POSTGRE_DB"
