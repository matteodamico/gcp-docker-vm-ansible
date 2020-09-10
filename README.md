# gcp-docker-vm-ansible
Playbook for provisioning two VMs in Google Cloud Platform (GCP) with Docker.


### PLEASE SEE THE BRANCH 
*docker_swarm_centos* to create two CentOS VM in Google Cloud Platform (GCP) with Docker and Docker Swarm
*docker_swarm_debian* to create two Debian VM in Google Cloud Platform (GCP) with Docker and Docker Swarm


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
Please use the following command to install nickjj.docker role with ansible-galaxy.

`$ ansible-galaxy install nickjj.docker`
`$ ansible-galaxy install nickjj.user`

[Ref.] (https://github.com/nickjj/ansible-docker/tree/v1.9.0)

###  Multiple inventory sources
This playbook uses multiple inventory sources: both static and dynamic inventory (with gcp pluging)

-----------

## License

MIT
