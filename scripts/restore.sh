#!/bin/bash

docker exec -i postgres-db psql -U user mydatabase < ../db_data/dump.sql
