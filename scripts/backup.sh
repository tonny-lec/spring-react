#!/bin/bash

docker exec -t postgres-db pg_dump -U user mydatabase > ../db_data/dump.sql
