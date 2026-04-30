.DEFAULT_GOAL := help

include makefiles/colors.mk
include makefiles/help.mk
include makefiles/macros.mk

#------------------------------------
# Installation
#------------------------------------
BIN_DIR := /usr/local/bin

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
	@actionlint
	@prettier --check ./.github/**/*.yaml ./**/*.yaml
	@prettier --check ./**/*.json

.PHONY: format
## Format files
format:
	$(call print,Formatting files)
	@shfmt -l -w .
	@prettier --write ./.github/**/*.yaml ./**/*.yaml
	@prettier --write ./**/*.json
#------------------------------------
