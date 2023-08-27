#!/bin/bash

#ssh-keygen -F github.com || ssh-keyscan github.com >> ~/.ssh/known_hosts > file.log 2>&1

git config user.name "Florian Wartner" > file.log 2>&1

git config user.email "florian@wartner.io" > file.log 2>&1

su root
cd /root/config

git add . > file.log 2>&1
echo "-----> git add done"

git status
echo "-----> git status done"

NOW=$(date +"%d/%m/%Y %H:%M") > file.log 2>&1

git commit -m "Automated: HA Config as at $NOW" > file.log 2>&1
echo "-----> git commit done"

git push -u origin main > file.log 2>&1
echo "-----> git push done"
echo "-----> all done"
