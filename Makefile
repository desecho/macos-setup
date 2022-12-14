.DEFAULT_GOAL := help

include makefiles/colors.mk
include makefiles/help.mk
include makefiles/macros.mk

#------------------------------------
# Installation
#------------------------------------
BIN_DIR := /usr/local/bin

SHFMT_VERSION := 3.4.3
SHFMT_PATH    := ${BIN_DIR}/shfmt

.PHONY: install-shfmt
install-shfmt:
	$(call print,Installing shfmt)
	@sudo curl https://github.com/mvdan/sh/releases/download/v${SHFMT_VERSION}/shfmt_v${SHFMT_VERSION}_linux_amd64 -Lo ${SHFMT_PATH}
	@sudo chmod +x ${SHFMT_PATH}

ACTIONLINT_VERSION := 1.6.13
ACTIONLINT_PATH    := ${BIN_DIR}/actionlint
ACTIONLINT_URL     := https://github.com/rhysd/actionlint/releases/download/v${ACTIONLINT_VERSION}/actionlint_${ACTIONLINT_VERSION}_linux_amd64.tar.gz
ACTIONLINT_TMP_DIR := $(shell mktemp -d)
ACTIONLINT_ARCHIVE := actionlint.tar.gz

.PHONY: install-actionlint
install-actionlint:
	$(call print,Installing actionlint)
	@cd ${ACTIONLINT_TMP_DIR} && \
	curl ${ACTIONLINT_URL} -Lo ${ACTIONLINT_ARCHIVE} && \
	tar -xvf ${ACTIONLINT_ARCHIVE} && \
	sudo mv actionlint ${ACTIONLINT_PATH}

.PHONY: install-linters-binaries
## Install linters binaries | Installation
install-linters-binaries: install-shfmt install-actionlint

.PHONY: install-ansible
## Install Ansible
install-ansible:
	$(call print,Installing Ansible)
	@ansible/install_ansible.sh

.PHONY: install-oh-my-zsh-1
## Install Oh My Zsh (1)
install-oh-my-zsh-1:
	$(call print,Installing Oh My Zsh Part 1)
	@oh_my_zsh/install_oh_my_zsh_1.sh

.PHONY: install-oh-my-zsh-2
## Install Oh My Zsh (2)
install-oh-my-zsh-2:
	$(call print,Installing Oh My Zsh Part 2)
	@oh_my_zsh/install_oh_my_zsh_2.sh

.PHONY: configure-vs-code
## Configure VS Code
configure-vs-code:
	$(call print,Configuring VS Code)
	@vs_code/configure_vs_code.sh

.PHONY: install-brew-pkgs
## Install Homebrew packages
install-brew-pkgs:
	$(call print,Installing Homebrew packages)
	@scripts/install_brew_pkgs.sh

.PHONY: install-python-pkgs
## Install Python packages
install-python-pkgs:
	$(call print,Installing Python packages)
	@scripts/install_python_pkgs.sh
#------------------------------------

#------------------------------------
# Commands
#------------------------------------
.PHONY: provision
## Provision | Commands
provision:
	$(call print,Provisioning)
	@ansible/provision.sh

.PHONY: lint
## Run linters
lint:
	$(call print,Linting)
	@shfmt -l -d .
	@scripts/shellcheck.sh
	@markdownlint README.md
	@actionlint
	@prettier --check ./.github/**/*.yaml ./**/*.yaml
	@prettier --check ./**/*.json

.PHONY: format
## Format files
format:
	$(call print,Formatting files)
	@shfmt -l -w .
	@markdownlint README.md --fix
	@prettier --write ./.github/**/*.yaml ./**/*.yaml
	@prettier --write ./**/*.json
#------------------------------------
