#!/bin/bash

sudo apt update;

cd ansible;

sudo apt install ansible --assume-yes;

sudo ansible-galaxy install nickjj.docker;

sh ../part0_source_creds.sh
