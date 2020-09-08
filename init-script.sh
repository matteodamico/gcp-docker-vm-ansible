#!/bin/bash

sudo apt update

pushd ansible

pip install ansible 
pip install requests google-auth

#sudo apt install ansible --assume-yes

sudo ansible-galaxy install nickjj.docker

popd 

source part0_source_creds.sh
