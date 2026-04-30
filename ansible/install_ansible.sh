#!/bin/bash

set -eou pipefail

ANSIBLE_VERSION=13.6.0

LC_ALL=C

# Install ansible
pip3 install ansible=="${ANSIBLE_VERSION}"
