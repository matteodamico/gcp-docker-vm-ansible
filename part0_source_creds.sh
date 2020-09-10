#!/bin/bash

# author: Matteo D'Amico
# license: MIT License
# purpose: Source Ansible/GCP credentials
# usage: source ./part0_source_creds.sh

export GCP_PROJECT='engaged-pottery-288209'
export GCP_AUTH_KIND='serviceaccount'
#export GCP_SERVICE_ACCOUNT_EMAIL='ansible@engaged-pottery-288209.iam.gserviceaccount.com'
export GCP_SERVICE_ACCOUNT_FILE='~/keys/saccount.json'
export GCP_SCOPES='https://www.googleapis.com/auth/compute'
export GCP_ZONE='us-central1-a'
export GCP_REGION='us-central1'
