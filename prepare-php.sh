#!/bin/sh

# Generate SSH
[[ ! -f ~/.ssh/id_rsa ]] && ssh-keygen -f ~/.ssh/id_rsa -N ""

# Configure VIM
cat <<'EOF' > ~/.vimrc
source /usr/share/vim/vim82/defaults.vim
set mouse=
EOF

# Create .local/bin
# mkdir -p $HOME/.local/bin

# Install Docker Compose v2
export DOCKER_COMPOSE_DLVERSION=v2.24.2

if [ -f ~/.docker/cli-plugins/docker-compose ]; then
    echo 'docker-compose exists. not install'
else
    mkdir -p ~/.docker/cli-plugins/
    curl -SL https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_DLVERSION/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
    chmod +x ~/.docker/cli-plugins/docker-compose
    docker compose version
fi

# Install Composer 2
if [ -f /usr/local/bin/composer ]; then
    echo 'composer exists. not install'
else
    cd ~
    curl -sS https://getcomposer.org/installer | php
    # move composer into a bin directory you control:
    sudo mv composer.phar /usr/local/bin/composer
    composer about
fi
