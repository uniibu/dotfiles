#!/bin/bash

sudo apt update && sudo apt-get upgrade -y

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt-get install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

install curl
install wget
install git
install nano
install build_essential
install htop
install nmap
install software-properties-common
install apt-transport-https
install ca-certificates
install gnupg-agent

echo "📦 Installing nvm"
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

source ~/.bashrc
nvm install --lts --latest-npm
npm install yarn pm2 -g

echo "🐍 Installing Python"
install python3-venv
install python3-pip

echo "Installing Go"

sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt update
install golang-go

go get github.com/github-release/github-release

sudo apt update
sudo apt autoremove -y

rm -- "$0"
