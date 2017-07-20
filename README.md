Information about Playbook 
============================

This playbook deploys a very basic implementation of Tomcat Application Server, version 8.x(any version can be deployed, we just have to set the version variable defined in group_vars/tomcat to therequired version). 
To use them, first edit the "hosts" inventory file to contain the hostnames of the machines on which you want Tomcat deployed, and edit the group_vars/tomcat file to set any Tomcat configuration parameters you need.

System Requirement
===================

Ansible 1.2 or newer

Works on CentOS/Suse/RHEL 6.x hosts

Ansible-tomcat role
=====================

See: roles/tomcat8/tasks/main.yml

Building
============

yum install -y epel-release

yum install -y --enablerepo=epel python-pip 

yum pip install ansible

Repository Clone
=============================

git clone https://github.com/Kriti6singh/Ansible-Tomcat.git

Setup hosts
=============

vi /etc/hosts 

hostname/ip tomcat-server

Example - 192.168.56.10 tomcat-server

Note** - You can also add the target host in hosts file in the code.

Share the SSH key 
=================================

Generate the host key on the target server if not present already 

ssh-keygen -t rsa

copy the id_rsa.pub key into the authorized key of Ansible host (host which is being to used to run the playbook)

Run ansible-playbook
=====================

cd Ansible-Tomcat

ansible-playbook -i hosts tomcat.yml

When the playbook run completes, you should be able to see the Tomcat Application Server running on the ports you chose, on the target machines.

http://tomcat-server:8080/index.html 

Installation Path , log location and startup commands 
=====================================================

Install Location - /opt/tomcat

Log Location - /opt/tomcat/tomcat/logs

Port - 8080

Startup Command -  systemctl stop/start/restart tomcat

Process will be owned by tomcat user.



