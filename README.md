# Automated setup of an Intel SGX Development Machine
This repository contains an Ansible playbook for setting up a development machine with Intel SGX

## Requirements
### Hardware
A computer with Intel SGX support is needed.

[This repository](https://github.com/ayeks/SGX-hardware) lists some of the computers that support Intel SGX.

We have the following systems up and running:
* [Intel NUC NUC8i3BEH2](https://ark.intel.com/content/www/us/en/ark/products/126150/intel-nuc-kit-nuc8i3beh.html) (not suitable for production mode!)
* [Dell PowerEdge R340 Rack Server](https://www.dell.com/en-us/work/shop/povw/poweredge-r340) with an Intel Xeon E-2176G, 3.7GHZ processor (suitable for production mode with commercial license)

**IMPORTANT** The CPU of the PowerEdge R340 is essential! There are cheaper versions availabe, but they don't support all features of Intel SGX.

### Software
To run the script, a fresh installation of a Linux is required. We have successfully tested the script with Ubuntu 18.04.3 LTS (bionic) server.

## Overview
The Ansible playbook will perform the following steps:
1. Update the system
2. Configure the network (using `netplan`) to DHCP on both network interfaces (eno0 and eno1)
3. Configure the keyboard and timezone
4. Create users that can login with a public key
5. Install the required tools (git, nano, tmux, zsh, gcc, ...)
6. Install the Intel SGX SDK, PSW and driver with the specified version
7. Install and enable samba for every user

Because samba requires a password, the script will generate a file called `samba-temp-password.txt` in the home directory of the user containing the initial password. Instructions how to change the password is shown in the ssh login screen.

Be careful when executing the script on a running system as it may reboot the system. You can disable it in `ServersSGX.yml`.

The script can also be used to update your server (for example for updating the Intel SGX SDK). Simply change the setting and re-run the script.

Currently, there is only one host configured (see `hosts`), but you can add as many as you want.

## Configuration
The configuration is done with two files:
* `host_vars/devsgx00.yaml`: Specific host configuration
* `group_vars/developmentServersSGX.yml`: Global configuration

All variables with `<...>` need to be replaced by your own settings.

### host_vars/devsgx00.yaml
* Define the user on the remote machine that has sudo permission.
* Define the host name of the new machine.
* Adapt (if needed) the network configuration. We use DHCP and sending the MAC-address to the DHCP server.

### group_vars/developmentServersSGX.yml
* Define the domain the server will join.
* Define the user names and specify their public keys for ssh login.
* Specify the Intel SGX Driver and Intel SGX SDK version to be installed. Use the tags from the Intel github repository.

## Run
To execute the playbook, simply execute:
```bash
ansible-playbook site.yml -k
```
