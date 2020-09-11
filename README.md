# gcp-docker-vm-ansible
This playbook creates two CentOS VMs in Google Cloud Platform (GCP) with Docker and Docker Swarm.


### PLEASE SEE THE BRANCH 
- *master* to create two CentOS VMs in Google Cloud Platform (GCP) with Docker
- *docker_swarm_debian* to create two Debian VMs in Google Cloud Platform (GCP) with Docker and Docker Swarm

-----------
### REQUIREMENTS
- have an account on GCP
- have a running Debian instance where run this playbook
- have created a service account (configured with relative grants) linked to GCP project
- have generated (public and private) keys linked to the service account.
Please see this [guide](https://developers.redhat.com/blog/2020/05/06/using-ansible-to-automate-google-cloud-platform/) to set up your gcp environment.

-----------
### Features
- This playbook creates an user [docker] and assing it to the docker group that can query the docker service without use the root privilegies.
- This playbook add the docker daemon to the autostartup at system boot. 
- This playbook open 2 ports on the GCP firewall: 888 port for swarmpit, 8080 for nginx ( removed them if you don't use )


### First installation
Set up properly *var* fields in part0_source_creds.sh file based on your project name.
Run the init-script with to set variables and install the ansible binaries

`$ source init-script.sh`

### Usage

Set up properly the inventory file and the *var* fields in role_user_vars.yml based on your needs.
Then run the playbook

`$ sh run-playbook.sh`

## Deploy a simple application on the Swarm
To deploy a new stack within the cluster. Login in the Swarmpit UI, go to Stacks Tabs and create a new one.
Set the stack name and past the following code in editor:
`version: '3'

services:
    app:
        image: nginx
        ports: 
            - "8080:80"
`
### Ansible Roles used
This playbook uses a ansible-role to install and configure docker in the VMs.
Please use the following command to install the roles with ansible-galaxy.

`$ ansible-galaxy install atosatto.docker-swarm`  
`$ ansible-galaxy install nickjj.user`

[Ansible-dockerswarm] (https://github.com/atosatto/ansible-dockerswarm)  
[Ansible user] (https://github.com/nickjj/ansible-user)

###  Multiple inventory sources
This playbook uses multiple inventory sources: both static and dynamic inventory (with gcp pluging)

### Test
You can perform some test using molecule.
Run *test.sh* file

Check if the cluster is active check running the following command in manager node:
`docker system info | grep Swarm`

To test the Reachability of the master run the follow command on the manager instance:
`docker node inspect <master_node_id>  --format "{{ .ManagerStatus.Reachability }}"`

To test if the node, as a worker, can accept tasks
`docker node inspect <node_id> --format "{{ .Status.State }}"`

-----------
## License

MIT
