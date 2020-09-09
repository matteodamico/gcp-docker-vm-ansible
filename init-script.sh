#!/bin/bash

sudo apt update -y

pushd ansible

pip install ansible 
pip install requests google-auth
pip install tox
sudo apt-get install -y python3-jmespath

ansible-galaxy install nickjj.user
ansible-galaxy install atosatto.docker-swarm

popd 

source part0_source_creds.sh

cp role_user_vars.yml ansible/roles/nickjj.user/defaults/main.yml
cp role_docker_vars.yml ansible/role/nickjj.docker/defaults/main.yml
