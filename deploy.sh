#!/bin/sh

echo "Deploy pods"

echo "bx login -a $CF_TARGET_URL"
bx login -a "$CF_TARGET_URL" -u "$BLUEMIX_USER" -p "$BLUEMIX_PASSWORD"

# Init container clusters
#echo "bx cs init"
#bx cs init -u "$BLUEMIX_USER" -p "$BLUEMIX_PASSWORD"
