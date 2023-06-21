#!/bin/bash

yarn_repo="deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main"
yarn_gpg="https://dl.yarnpkg.com/debian/pubkey.gpg"

#Install yarn
cd /opt

/usr/bin/curl -sSL $yarn_gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
echo "$yarn_repo" | tee /etc/apt/sources.list.d/yarn.list
/usr/bin/apt-get update
/usr/bin/apt-get install --yes yarnpkg
