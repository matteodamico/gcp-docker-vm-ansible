#!/bin/bash

sudo apt update -y

pushd ansible

pip install ansible 
pip install requests google-auth
ansible-galaxy install nickjj.user

popd 

source part0_source_creds.sh

cp role_user_vars.yml ansible/roles/nickjj.user/defaults/main.yml
