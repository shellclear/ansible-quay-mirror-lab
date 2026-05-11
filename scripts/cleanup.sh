#!/usr/bin/env bash

podman rm -f registry01-quay317-postgresql-quay \
             registry01-quay317-redis-quay \
             registry01-quay317-quay-registry \
             registry02-quay317-postgresql-quay \
             registry02-quay317-redis-quay \
             registry02-quay317-quay-registry \
             registry01-quay317-quay-mirror \
             registry02-quay317-quay-mirror \
             registry01-quay314-postgresql-quay \
             registry01-quay314-redis-quay \
             registry01-quay314-quay-registry \
             registry02-quay314-postgresql-quay \
             registry02-quay314-redis-quay \
             registry02-quay314-quay-registry \
             registry01-quay314-quay-mirror \
             registry02-quay314-quay-mirror

podman volume prune -f
