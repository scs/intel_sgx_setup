role-intel-sgx
=========

This ansible role installs Intel SGX driver, SDK and PSW along with their dependencies. This playbook has been tested with Ansible v2.8 on Ubuntu 18.04

Requirements
------------
ansible

Role Variables
--------------

The following variables at this implementation are received from the group_vars folder, so that they remain the same across different servers

intel_sgx_umbrella_directory: "/opt/intel"
This variable defines the directory where the Driver, SDK and PSW are installed.

intel_sgx_git_SDK_PWD_version_tag: "sgx_2.5"
This variable defines the version of the SDK and PWD that will be installed. This has to be a valid version, for more info look at the official github page here: https://github.com/intel/linux-sgx/releases

intel_sgx_SDK_PWD_directory: "linux-{{ intel_sgx_git_SDK_PWD_version_tag }}"
This variable defines the directory, where SDK and PWD. This directory is now associated with the sdk_version, to avoid overwriting a previous version with a newer one. However, it can be further modified, to install the same sdk version with possibly different make options.

intel_sgx_git_DRIVER_version_tag: 'sgx_driver_2.5'
This variable defines the version of the sgx driver that will be installed. This has to be a valid version, for more info look at the official github page here: https://github.com/intel/linux-sgx-driver/releases

intel_sgx_DRIVER_directory: "linux-{{ intel_sgx_git_DRIVER_version_tag }}"
This variable defines the directory, where sgx driver. This directory is now associated with the sgx driver version, to avoid overwriting a previous version with a newer one. However, it can be further modified. Please not that to uninstall the SGX driver, the following commands need to be followed. https://github.com/intel/linux-sgx-driver#uninstall-the-intelr-sgx-driver


Dependencies
------------
The following dependencies are necessary for this role:
 - build-essential
 - ocaml
 - ocamlbuild
 - automake
 - autoconf
 - libtool
 - wget
 - python
 - libssl-dev
 - libcurl4-openssl-dev
 - protobuf-compiler
 - libprotobuf-dev
 - debhelper
 - cmake
 - expect

The role uses apt to install the above dependencies

Example Playbook
----------------
    - hosts: servers    
      roles:
        - { role: role-intel-sgx, become: yes }
