#!/usr/bin/env bash

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd "$SCRIPT_DIR"

. ../ansible-dev-tools/bin/activate

export ANSIBLE_COLLECTIONS_PATH=../collections

ansible-galaxy collection install -p ../collections -r ../requirements.yaml
