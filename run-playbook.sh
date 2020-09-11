#!/bin/bash

cd ansible;

ansible-playbook playbooks/playbook.yml
#-i inventories/
#-i inventory.compute.gcp.yml
