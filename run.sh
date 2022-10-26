#!/usr/bin/env bash

set -x
set -e

export ZOOKEEPER_PORT=2181
export KAFKA_PORT=9092
export POSTGRES_PORT=5432
export API_GATEWAY_PORT=8080
export USER_SERVICE_PORT=8081
export PARCEL_SERVICE_PORT=8082
export DB_USER=postgres
export DB_PASSWORD=password
export DATABASE_NAME=users

docker-compose -f docker-compose.yml up -d