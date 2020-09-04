#!/bin/bash

# author: Matteo D'Amico
# license: MIT License
# purpose: Source Ansible/GCP credentials
# usage: source ./ansible_gcp_creds.sh

export GCP_PROJECT='engaged-pottery-288209'
export GCP_AUTH_KIND='serviceaccount'
export GCP_SERVICE_ACCOUNT_FILE='~/keys/saccount.json'
export GCP_SCOPES='https://www.googleapis.com/auth/compute'