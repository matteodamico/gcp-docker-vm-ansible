# gcp-docker-vm-ansible [![Build Status](https://travis-ci.org/matteodamico/gcp-docker-vm-ansible.svg?branch=docker_swarm_centos.png)](https://travis-ci.org/github/matteodamico/gcp-docker-vm-ansible)
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
- This playbook adds the docker daemon to the autostartup at system boot. 
- This playbook opens 2 ports on the GCP firewall: 888 port for swarmpit, 8080 for nginx ( remove them if you don't use )

### Ansible Roles used
This playbook uses an ansible-role to install and configure Docker in the VMs.
Please use the following command (or run init-script.sh - see below) to install the roles with ansible-galaxy.

`$ ansible-galaxy install atosatto.docker-swarm`  
`$ ansible-galaxy install nickjj.user`

[Ansible-dockerswarm] (https://github.com/atosatto/ansible-dockerswarm)  
[Ansible user] (https://github.com/nickjj/ansible-user)

###  Multiple inventory sources
This playbook uses multiple inventory sources: both static and dynamic inventory (with gcp pluging)


### First installation
Set up properly *var* fields in part0_source_creds.sh file based on your project name.
Run the init-script using *source* command to set variables and install the ansible binaries

`$ source init-script.sh`

### Usage
Set up properly the inventory file and the *var* fields in role_user_vars.yml based on your needs.
Then run the playbook

`$ sh run-playbook.sh`

### Protect the docker daemon
See this [page] (https://docs.docker.com/engine/security/https/) to understand how to protect the docker daemon.

### Use another socket type to link to docker engine
The Docker daemon can listen for Docker Engine API requests via three different types of Socket: unix, tcp, and fd.
By default, a unix domain socket (or IPC socket) is created at /var/run/docker.sock, requiring either root permission, or docker group membership.
If you are interested in a connection via *tcp* protocol (or others) please see this [page] (https://docs.docker.com/engine/reference/commandline/dockerd/#daemon-socket-option).

### Deploy a simple application on the Swarm
To deploy a new stack within the cluster you can use the Swarmpit application installed within the cluster.
The login page is reachable on the master node ip-address at 888 port.
Use the following default credentials to log in:

```txt
user:admin
password:administrator
```

Once logged into the Swarmpit UI, go to Stacks tab and create a new one.
Insert the stack name and paste the following code in editor:
```yaml 
version: '3'

services:
    app:
        image: nginx
        ports: 
            - "8080:80"
```


### Tests
The repository (currently this branch) is linked to [Travis CI](https://travis-ci.org/) to perform some automation.
In particular will be performed a ansible-lint (ignoring warnings).

In addiction, you can perform some test using molecule.
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
