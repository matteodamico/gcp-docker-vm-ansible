#!/bin/bash

cd ansible;

#echo "Test variabile GCP_SERVICE_ACCOUNT_EMAIL:"
#echo $GCP_SERVICE_ACCOUNT_EMAIL

ansible-playbook playbooks/playbook.yml -vvv -i inventory;
