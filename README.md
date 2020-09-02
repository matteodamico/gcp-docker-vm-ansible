# gcp-docker-vm-ansible
Playbook for provisioning two VMs with Docker and Docker Swarm


Usage: ansible-playbook playbook.yml

### Installation
This playbook uses a ansible-role to install and configure docker in the VMs.
Please use the following command to install nickjj.docker role with ansible-galaxy.

`$ ansible-galaxy install nickjj.docker`

[Ref.] (https://github.com/nickjj/ansible-docker/tree/v1.9.0)



## License

MIT
