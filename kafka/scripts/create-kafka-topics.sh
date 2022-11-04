#!/bin/bash

KAFKA_BROKER=localhost
KAFKA_PORT=9092

kafka-topics --create \
--bootstrap-server "$KAFKA_BROKER":"$KAFKA_PORT" \
--replication-factor 1 \
--partitions 1 \
--topic fetch-users \
&&
kafka-topics --create \
--bootstrap-server "$KAFKA_BROKER":"$KAFKA_PORT" \
--replication-factor 1 \
--partitions 1 \
--topic create-user