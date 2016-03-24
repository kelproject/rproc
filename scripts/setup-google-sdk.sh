#!/bin/bash
set -ev

pip install pyopenssl

if [ ! -d "${HOME}/google-cloud-sdk" ]; then
    curl -s https://sdk.cloud.google.com | bash
else
    echo "Google Cloud SDK already installed; skipping"
fi

openssl aes-256-cbc -K $encrypted_8a0dc7e65d70_key -iv $encrypted_8a0dc7e65d70_iv -in gcp-travisci.json.enc -out gcp-travisci.json -d

gcloud auth activate-service-account --key-file gcp-travisci.json travisci@project-kel.iam.gserviceaccount.com