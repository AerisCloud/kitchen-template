# AerisCloud Kitchen Setup

This is a template as well as a set of Docker images for using `kitchen` with
Ansible. To use it just copy the content of the `template` directory into your
role's folder and edit the following files:

> `test/integration/default/default.yml`

This is where you run the role, if you need to run any dependency or do any
pre/post task this is where you should do it.

> `test/integration/default/serverspec/default_spec.rb`

This is the `serverspec` file, and where you type your tests. For more details
about the available resources, see http://serverspec.org/resource_types.html

> `.kitchen.yml`

Optional, but if the role doesn't support an operating system, you can remove
it from the `platforms` array. If you need to add a platform, make sure to point
the start command to the operating system's init.

## Requirements

* Docker
* Ruby

## Tested OS

* Ubuntu 16.04
* Centos 7.4
* Debian 8
* Debian 9

## Installing kitchen

The recommended way is to install RVM then run `bundle install` from your role's
folder. If your RVM is configured properly the `kitchen` should now be available
on your command-line.

## Usage

> Working on all containers

```bash
# Create the containers and do the initial provisioning
$ kitchen setup
# Once your tests are ready
$ kitchen verify
# Once you are done
$ kitchen destroy
```

> Working a single container

```bash
# List the available containers
$ kitchen list
# Run the commands above while specifying the target container
$ kitchen setup default-debian-9
$ kitchen converge default-debian-9
```

> Inspecting a container

``` bash
kitchen login default-debian-9
```

> Run all tests and destroy the container

```bash
kitchen test
```

## References

* [`Kitchen`](http://kitchen.ci/docs/getting-started)
* [`Ansible`](http://docs.ansible.com/ansible/latest/index.html)
* [`serverspec`](http://serverspec.org/resource_types.html)