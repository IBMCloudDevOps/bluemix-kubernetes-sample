#!/bin/bash
echo "Install Bluemix CLI"
. ./install_bx.sh

echo "Login to Bluemix"
./bx_login.sh

echo "Deploy pods"
./deploy.sh
