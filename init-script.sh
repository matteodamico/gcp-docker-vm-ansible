#!/bin/bash

sudo apt update -y
#sudo apt install python3-pip -y
sudo apt install python -y
sudo apt install python-pip -y
sudo apt install software-properties-common -y
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y

pushd ansible

pip install requests google-auth
ansible-galaxy install nickjj.user

popd 

source part0_source_creds.sh

cp role_user_vars.yml ansible/roles/nickjj.user/defaults/main.yml
