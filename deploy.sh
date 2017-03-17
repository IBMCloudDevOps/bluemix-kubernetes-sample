#!/bin/sh

echo "Deploy pods"

echo "bx login -a $CF_TARGET_URL"
bx login -a "$CF_TARGET_URL" -u "$BLUEMIX_USER" -p "$BLUEMIX_PASSWORD" -c "$BLUEMIX_ACCOUNT" -o "$BLUEMIX_ORGANIZATION" -s "$BLUEMIX_SPACE"

# Init container clusters
echo "bx cs init"
bx cs init -u "$BLUEMIX_USER" -p "$BLUEMIX_PASSWORD"
