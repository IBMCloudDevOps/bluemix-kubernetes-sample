#!/bin/sh

if [ -z $CF_ORG ]; then
  CF_ORG="$BLUEMIX_ORG"
fi
if [ -z $CF_SPACE ]; then
  CF_SPACE="$BLUEMIX_SPACE"
fi

#Check for api key or PW
if [[ -z "$BLUEMIX_USER" || -z "$BLUEMIX_PASSWORD" || -z "$BLUEMIX_ACCOUNT" ]] && [ -z "$BLUEMIX_API_KEY" ]; then
  echo "Define all required environment variables and rerun the stage."
  exit 1
fi
echo "Deploy pods"

echo "bx login -a $CF_TARGET_URL"

# Use API_KEY if exists
if [ -n "$BLUMEIX_API_KEY" ]; then
  echo "Logging in with API key"
  bx login -a "$CF_TARGET_URL" --apikey "$BLUEMIX_API_KEY" -o "$CF_ORG" -s "$CF_SPACE"
else
  echo "Logging in with user credentials"
  bx login -a "$CF_TARGET_URL" -u "$BLUEMIX_USER" -p "$BLUEMIX_PASSWORD" -c "$BLUEMIX_ACCOUNT" -o "$CF_ORG" -s "$CF_SPACE"
fi

if [ $? -ne 0 ]; then
  echo "Failed to authenticate to Bluemix"
  exit 1
fi

# Init container clusters
echo "bx cs init"
bx cs init
if [ $? -ne 0 ]; then
  echo "Failed to initialize to Bluemix Container Service"
  exit 1
fi
