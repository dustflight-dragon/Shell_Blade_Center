#!/bin/sh

cd /opt/Xpay/

git fetch --all

git reset --hard origin/master

git pull origin master

git merge origin/test

