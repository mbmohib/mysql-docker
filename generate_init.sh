#!/bin/bash
envsubst < /docker-entrypoint-initdb.d/init_template.sql > /docker-entrypoint-initdb.d/init.sql