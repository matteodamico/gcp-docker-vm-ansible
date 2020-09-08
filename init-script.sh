#!/bin/bash

sudo apt update

pushd ansible

pip install ansible 
pip install requests google-auth

# you can use the follow ansible-role if you are running in Ubuntu OS
# ansible-galaxy install nickjj.docker
ansible-galaxy install nickjj.user

popd 

source part0_source_creds.sh

cp role_user_vars.yml ansible/roles/nickjj.user/defaults/main.yml
# cp role_docker_vars.yml ansible/role/nickjj.docker/defaults/main.yml
