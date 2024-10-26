#!/bin/bash

cat ./db_data/dump.sql | docker exec -i calmline-focus_devcontainer-db-1 psql -U user -d mydatabase
