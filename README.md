# macOS Setup

## Initial setup

Install these apps:

* [iTerm2](http://www.iterm2.com/)
* [VS Code](https://code.visualstudio.com/)
* [Chrome](https://www.google.com/intl/en/chrome/browser/)
* [Docker](https://docs.docker.com/engine/install/)
* [1Password](https://1password.com/)
* [Homebrew](http://brew.sh/)
* [Cakebrew](https://www.cakebrew.com/)
* [Go](https://go.dev/dl/)
* [Node.js](https://nodejs.org/en/)
* [NordLocker](https://nordlocker.com/download/mac/)

Install these apps from the App Store:

* [Simplenote - Notes and Memos](https://apps.apple.com/ca/app/simplenote-notes-and-memos/id692867256?mt=12)
* [Xcode](https://apps.apple.com/ca/app/xcode/id497799835?mt=12)
* [1Password for Safari](https://apps.apple.com/ca/app/1password-for-safari/id1569813296?mt=12)
* [VPN for privacy | NordVPN](https://apps.apple.com/ca/app/vpn-for-privacy-nordvpn/id905953485)

Type `git` in the terminal - this will install developer tools.

Configure:

* Run Docker
* Open `Preferences` → `General` → enable `Start Docker Desktop when you log in`

### Configure kubectl

Save kubeconfig

```bash
mkdir ~/.kube
nano ~/.kube/config
```

## Configuration

Open `Finder` → `Preferences` → `General`

* `New Finder window show` → select home directory

Open `Finder` → `Preferences` → `Advanced`

![Finder preferences advanced](images/finder-preferences-advanced.png)

Open `System Preferences` → `Keyboard` → `Keyboard`

* Enable `Use F1, F2, etc. keys as standard function keys`
* `Key repeat` - set to the fastest setting

Open `System Preferences` → `Keyboard` → `Input Sources`

* Add `Russian - PC`

Open `System Preferences` → `Dock & Menu Bar`

* `Minimize windows using` → set `Scale effect`
* enable `Minimize windows into application icon`
* enable `Automatically hide and show the Dock`

Open `System Preferences` → `Software Update`

* enable `Automatically keep my Mac up to date`

Open `System Preferences` → `Touch ID`

* Add fingerprint

### Setup VS Code

* Launch VS Code
* Open the Command Palette [Cmd + Shift + P] and type `Install 'code' command in PATH`

## Setup/Configuration

Run terminal and set white on black color scheme. Then run

```bash
sudo su
USERNAME="[username]"
echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
```

Create a key with

```bash
EMAIL="[email]"
ssh-keygen -t rsa -C "$EMAIL" -N ""
cat ~/.ssh/id_rsa.pub
```

Add key on the GitHub [SSH and GPG keys settings page](https://github.com/settings/keys)

Then run

```bash
git clone git@github.com:desecho/macos-setup.git
cd macos-setup
```

To configure VS Code run

```bash
make configure-vs-code
```

To install [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) run

```bash
make install-oh-my-zsh
```

To install Homebrew packages run

```bash
make install-brew-pkgs
```

To install Python packages run

```bash
make install-python-pkgs
```

To install Ansible run

```bash
make install-ansible
```

Then you need to configure the variables in `ansible/vars.yml`.

You might also want to change variables in `ansible/roles/main/defaults/main.yml`.

Then run

```bash
make provision
```
