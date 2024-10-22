#!/bin/bash

# PostgreSQLコンテナからデータベースのダンプを取得
# docker exec postgres-db pg_dump -U postgres mydb > mydb_dump_$(date +"%Y%m%d%H%M%S").sql
# echo "Database dumped to mydb_dump_$(date +"%Y%m%d%H%M%S").sql"

docker exec -t postgres-db pg_dump -U user mydatabase > ../db_data/dump.sql
