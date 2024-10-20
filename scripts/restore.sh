#!/bin/bash

# # リストアするSQLファイルを指定
# if [ $# -eq 0 ]; then
#   echo "Usage: $0 <dump_file.sql>"
#   exit 1
# fi

# # PostgreSQLコンテナにリストア
# docker exec -i postgres-db psql -U postgres mydb < "$1"
# echo "Database restored from $1"

docker exec -i postgres_db psql -U user mydatabase < ../db_data/dump.sql
