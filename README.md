# gitlab-runner ansible

Deploys a gitlab-runner on centOS 7

## Requirement

 - ansible 2.6

## Usage

 - Add your runner key to `inventory_*` file
 - Add runner addresses to `inventory_*` file
 - Execute `./dev start`
 - Verify `http://runner-adr:8080/healthz`
 
## Deployment

```
$ ansible-playbook -i inventory_prod runner-playbook.yml
```
 
### Healthcheck

Will be served to `:8080/healthz`

## Development

### vagrant

`Vagrant 2.1.2`

A reachable gitlab instance is required.

```
# Setting up vm
$ vagrant start

# Execute ansible playbook
$ vagrant provision

# SSH
$ vagrant ssh

# stop VMs
$ vagrant halt

# remove VM
$ vagrant destroy
``` 

- gitlab-runner `192.168.33.10`

### docker

`docker-compose 1.22.0, build f46880fe`

`docker 18.06.1-ce`

The docker setup is just experimental at the moment.

```
# start environment
$ ./dev docker_start

# apply ansible playbook
$ ./dev docker_apply
```

- gitlab-ce `172.16.2.2` or `localhost:8080`
- gitlab-runner `172.16.2.3`
