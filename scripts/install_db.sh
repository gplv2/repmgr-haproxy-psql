echo "Install PG packages ..."

#!/bin/bash

sudo yum install -y http://yum.postgresql.org/9.5/redhat/rhel-7-x86_64/pgdg-redhat95-9.5-2.noarch.rpm

sudo yum install -y postgresql95-libs \
    postgresql95 \
    postgresql95-server \
    postgresql95-odbc \
    postgresql95-debuginfo \
    postgresql95-odbc-debuginfo \
    postgresql95-python-debuginfo \
    postgresql95-tcl-debuginfo \
    postgresql95-contrib \
    postgresql95-devel \
    postgresql95-docs \
    postgresql95-plperl \
    postgresql95-plpython \
    postgresql95-pltcl \
    postgresql95-python \
    postgresql95-tcl \
    postgresql95-test

sudo yum install -y https://rpm.2ndquadrant.com/site/content/2ndquadrant-repo-10-1-1.el7.noarch.rpm

sudo yum install git
sudo yum install pgbouncer.x86_64
sudo yum install repmgr

