#! /bin/bash
NVM_DIR="$HOME/.nvm" && \
	[ -s "$NVM_DIR/nvm.sh" ] && \
	. "$NVM_DIR/nvm.sh"

nvm install 8
nvm use 8

# We need lerna to build the dependencies

npm install -g lerna