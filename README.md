# gcp-docker-vm-ansible
This playbook creates two CentOS VMs in Google Cloud Platform (GCP) with Docker and Docker Swarm.


### PLEASE SEE THE BRANCH 
- *master* to create two CentOS VMs in Google Cloud Platform (GCP) with Docker
- *docker_swarm_debian* to create two Debian VMs in Google Cloud Platform (GCP) with Docker and Docker Swarm


 ### First installation
Set up properly *var* fields in part0_source_creds.sh file based on your project name.
Run the init-script with to set variables and install the ansible binaries

`$ source init-script.sh`

### Usage

Set up properly the inventory file and the *var* fields in playbook.yml based on your needs.
Then run the playbook

`$ sh run-playbook.sh`


### Ansible Roles used
This playbook uses a ansible-role to install and configure docker in the VMs.
Please use the following command to install the roles with ansible-galaxy.

`$ ansible-galaxy install atosatto.docker-swarm`
`$ ansible-galaxy install nickjj.user`

[Ansible-dockerswarm] (https://github.com/atosatto/ansible-dockerswarm)
[Ansible user] (https://github.com/nickjj/ansible-user)

###  Multiple inventory sources
This playbook uses multiple inventory sources: both static and dynamic inventory (with gcp pluging)

-----------

## License

MIT
