#!/usr/bin/env bash

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd "$SCRIPT_DIR"

$(which python3) -mvenv ../ansible-dev-tools
sleep 10
. ../ansible-dev-tools/bin/activate
pip install -U pip
pip install -r ../requirements.txt
