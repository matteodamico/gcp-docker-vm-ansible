#!/bin/bash

cd ansible;

ansible-playbook playbooks/playbook.yml -vvv
#-i inventories/
#-i inventory.compute.gcp.yml
