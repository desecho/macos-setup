#!/bin/bash

set -eou pipefail

cd "$(dirname "$0")"

CONFIG_PATH="$HOME/Library/Application Support/Code/User/"
# Configure settings
mkdir -p "$CONFIG_PATH"
cp configs/* "$CONFIG_PATH"

# Install extensions
code --install-extension ms-python.python
code --install-extension ms-azuretools.vscode-docker
code --install-extension golang.go
code --install-extension editorconfig.editorconfig
code --install-extension cameron.vscode-pytest
code --install-extension waderyan.gitblame
code --install-extension mohsen1.prettify-json
code --install-extension lextudio.restructuredtext
code --install-extension hashicorp.terraform
code --install-extension timonwong.shellcheck
code --install-extension github.copilot
code --install-extension geddski.macros
code --install-extension yzhang.markdown-all-in-one
code --install-extension trond-snekvik.simple-rst
code --install-extension octref.vetur
code --install-extension batisteo.vscode-django
code --install-extension Vue.volar
code --install-extension Vue.vscode-typescript-vue-plugin
