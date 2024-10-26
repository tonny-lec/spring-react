#!/bin/bash

docker exec calmline-focus_devcontainer-db-1 pg_dump -U user -d mydatabase > ./db_data/dump.sql
