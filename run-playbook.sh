#!/bin/bash

cd ansible;

ansible-playbook playbooks/playbook.yml -v -i inventory;
