ARG VARIANT=focal
FROM mcr.microsoft.com/vscode/devcontainers/base:${VARIANT}

ARG USERNAME=devpod

# Modify the user
RUN groupadd $USERNAME && \
usermod -d /home/$USERNAME -m -g $USERNAME -l $USERNAME vscode && \
echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME && rm -rf /etc/sudoers.d/vscode

RUN apt-get update && sudo apt-get upgrade -y && \
  apt-get install -y curl wget git nano build-essential htop nmap software-properties-common apt-transport-https ca-certificates gnupg-agent

ENV NVM_DIR $HOME/.nvm
ENV NODE_VERSION 12.18.3
RUN mkdir -p $NVM_DIR
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.35.3/install.sh | bash
RUN /bin/bash -l -c "\
  source $NVM_DIR/nvm.sh \
  && nvm install $NODE_VERSION \
  && nvm alias default $NODE_VERSION \
  && nvm use default && \
  npm install yarn pm2 -g"

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

RUN add-apt-repository ppa:deadsnakes/ppa && apt-get update && apt-get install -y python3.8 python3-pip

RUN add-apt-repository ppa:longsleep/golang-backports && apt-get update && apt-get install -y golang-go

RUN go get github.com/github-release/github-release

RUN apt-get update && apt autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

