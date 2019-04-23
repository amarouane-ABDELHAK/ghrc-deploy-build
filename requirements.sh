#! /bin/bash
export NVM_DIR="$HOME/.nvm" && \
	[ -s "$NVM_DIR/nvm.sh" ] && \
	. "$NVM_DIR/nvm.sh"

nvm install 8

nvm use 8