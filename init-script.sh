#!/bin/bash

sudo apt update

pushd ansible

sudo apt install ansible --assume-yes

sudo ansible-galaxy install nickjj.docker

popd 

source part0_source_creds.sh
