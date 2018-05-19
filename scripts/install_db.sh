echo "Install PG packages ..."


#yum install https://download.postgresql.org/pub/repos/yum/10/redhat/rhel-7-x86_64/pgdg-redhat10-10-2.noarch.rpm

yum install -y https://download.postgresql.org/pub/repos/yum/9.5/redhat/rhel-7-x86_64/pgdg-redhat95-9.5-3.noarch.rpm
yum install -y postgresql95
yum install -y postgresql95-server

#!/bin/bash
sudo yum install -y git

#/usr/pgsql-9.5/bin/postgresql95-setup initdb
#systemctl enable postgresql-9.5
#systemctl start postgresql-9.5

sudo yum install -y https://rpm.2ndquadrant.com/site/content/2ndquadrant-repo-9.5-1-1.el7.noarch.rpm

sudo yum install -y repmgr95.x86_64 pgbouncer.x86_64

