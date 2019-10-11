Role Name
=========

Installing some necessary tools in the server using apt.

Requirements
------------
none

Role Variables
--------------
none

Dependencies
------------
none

Example Playbook
----------------

- hosts: servers    
  roles:
  - { role: role-install-tools, become: yes }

License
-------

BSD
