#!/bin/bash

set -eou pipefail

python3 -m pip install --upgrade pip setuptools wheel

pip3 install tox docker-compose bpytop thefuck poetry
