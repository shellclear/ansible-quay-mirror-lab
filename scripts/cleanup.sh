#!/usr/bin/env bash

podman rm -f registry01-postgresql-quay registry01-redis-quay registry01-quay-registry registry02-postgresql-quay registry02-redis-quay registry02-quay-registry registry01-quay-mirror registry02-quay-mirror
podman volume prune -f
