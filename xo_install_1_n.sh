#!/bin/bash

n_repo="https://raw.githubusercontent.com/tj/n/master/bin/n"
n_location="/usr/local/bin/n"

# Install n
/usr/bin/curl -o $n_location $n_repo
/bin/chmod +x $n_location