# gcp-docker-vm-ansible
Playbook for provisioning two VMs in Google Cloud Platform (GCP) with Docker and Docker Swarm


### Usage 
Set up properly the inventory file and the *var* fields in playbook.yml based on your needs.
Run:
`$ ansible-playbook playbook.yml -i inventory`

### Installation
This playbook uses a ansible-role to install and configure docker in the VMs.
Please use the following command to install nickjj.docker role with ansible-galaxy.

`$ ansible-galaxy install nickjj.docker`

[Ref.] (https://github.com/nickjj/ansible-docker/tree/v1.9.0)



## License

MIT
