#! /bin/bash
. "$HOME/.nvm/nvm.sh"
cd $HOME/ghrc-deploy
npm install
npm run  build
./node_modules/.bin/kes cf compile --kes-folder app --region $AWS_REGION --deployment $deployment_name --template node_modules/@cumulus/deployment/app --role $roles

