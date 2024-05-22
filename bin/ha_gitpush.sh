#!/bin/sh

# To run before
git config core.sshCommand "ssh -i /.ssh/id_ed25519 -o 'StrictHostKeyChecking=no' -F /dev/null"

HA_VERSION=`cat .HA_VERSION`
COMMIT_CURRENT_DATE=$(date +'%d-%m-%Y %H:%M:%S')
COMMIT_MESSAGE="[$HA_VERSION]: $COMMIT_CURRENT_DATE"

echo "$COMMIT_MESSAGE"

git add .
git commit -m "$COMMIT_MESSAGE"
git push --set-upstream origin main