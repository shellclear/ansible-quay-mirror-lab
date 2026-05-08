#!/usr/bin/env bash

podman pull registry.access.redhat.com/ubi9/ubi-minimal:latest

for tag in latest dev ; \
    do podman tag \
        registry.access.redhat.com/ubi9/ubi-minimal:latest \
        registry01.quay317.lab.localdomain:8883/source_organization/private_repo01:$tag && \
        podman tag \
        registry.access.redhat.com/ubi9/ubi-minimal:latest \
        registry01.quay317.lab.localdomain:8883/source_organization/public_repo01:$tag ; \
done

for tag in latest dev ; \
    do podman push \
        registry01.quay317.lab.localdomain:8883/source_organization/private_repo01:$tag \
        --tls-verify=false --remove-signatures && \
        podman push \
        registry01.quay317.lab.localdomain:8883/source_organization/public_repo01:$tag \
        --tls-verify=false --remove-signatures ; \
done
