#!/bin/bash

cd ansible;

ansible-playbook playbooks/playbook.yml -i inventories/inventory.compute.gcp.yml -vvv
