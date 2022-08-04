#!/bin/bash

set -eou pipefail

ANSIBLE_VERSION=3.1.0

LC_ALL=C

# Install ansible
pip3 install ansible=="${ANSIBLE_VERSION}"
