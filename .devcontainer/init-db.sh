#!/bin/bash
psql -U postgres -c "CREATE DATABASE calmline;"
psql -U postgres -c "CREATE USER dev WITH ENCRYPTED PASSWORD 'devpassword';"
psql -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE calmline TO dev;"
