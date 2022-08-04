#!/bin/bash

set -eou pipefail

brew install mc
brew install wget
brew install jq
brew install shellcheck
brew install exa
brew install bat
brew install ncdu
brew install kubectl
brew install hadolint
brew install helm
brew install yq
brew install yh
brew install tflint
brew install s3cmd
brew install shfmt
brew install actionlint
brew install python@3.10
# shellcheck disable=SC2016
echo 'export PATH="/opt/homebrew/opt/python@3.10/bin:$PATH"' >> ~/.zshrc
