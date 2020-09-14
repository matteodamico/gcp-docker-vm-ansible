# gcp-docker-vm-ansible
This playbook creates two Debian VMs in Google Cloud Platform (GCP) with Docker and Docker Swarm.

-----------
### DEPRECADED - NOT TESTED
-----------


### PLEASE SEE THE BRANCH 
- *master* to create two CentOS VMs in Google Cloud Platform (GCP) with Docker
- *docker_swarm_centos* to create two CentOS VMs in Google Cloud Platform (GCP) with Docker and Docker Swarm

-----------
### REQUIREMENTS
- have an account on GCP
- have a running Debian instance where run this playbook
- have created a service account (configured with relative grants) linked to GCP project
- have generated (public and private) keys linked to the service account.
Please see this [guide](https://developers.redhat.com/blog/2020/05/06/using-ansible-to-automate-google-cloud-platform/) to set up your gcp environment.

-----------
 ### First installation
Set up properly *var* fields in part0_source_creds.sh file based on your project name.
Run the init-script with to set variables and install the ansible binaries

`$ source init-script.sh`

### Usage

Set up properly the inventory file and the *var* fields in role_user_vars.yml based on your needs.
Then run the playbook

`$ sh run-playbook.sh`


### Ansible Roles used
This playbook uses a ansible-role to install and configure docker in the VMs.
Please use the following command to install the roles with ansible-galaxy.

`$ ansible-galaxy install nickjj.docker`
`$ ansible-galaxy install nickjj.user`

[Ansible-docker] ((https://github.com/nickjj/ansible-docker)
[Ansible user] (https://github.com/nickjj/ansible-user)

###  Multiple inventory sources
This playbook uses multiple inventory sources: both static and dynamic inventory (with gcp pluging)

-----------

## License

MIT
