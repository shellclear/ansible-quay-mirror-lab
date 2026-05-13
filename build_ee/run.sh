#!/usr/bin/env sh

RUN_COMMAND="${1:-ansible_builder}"
REGISTRY="${2:-localhost}"
NAMESPACE="${3:-ansible-custom}"
IMAGE="${4:-ee-custom}"
TAG="${5:-latest}"
TLS_VERIFY="${6:-false}"

ansible_builder() {
    ansible-builder build --no-cache --prune-images -t ${REGISTRY}/${NAMESPACE}/${IMAGE}:${TAG}
}

ansible_create() {
    ansible-builder create
}

podman_build() {
    podman build -f context/Containerfile -t ${REGISTRY}/${NAMESPACE}/${IMAGE}:${TAG} --tls-verify=${TLS_VERIFY} --rm --force-rm context
}

podman_push() {
    podman push ${REGISTRY}/${NAMESPACE}/${IMAGE}:${TAG} --tls-verify=${TLS_VERIFY}
}

build_and_push() {
    ansible_builder
    podman_push
}

main() {
    echo "Run ${RUN_COMMAND} command"
    ${RUN_COMMAND}
}

main
