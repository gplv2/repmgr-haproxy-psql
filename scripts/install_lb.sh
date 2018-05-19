echo "Install packages ..."

yum update

yum install git
yum install keepalived
yum install haproxy
yum install ipvsadm
yum install indent

# configure keepalived.conf
systemctl enable keepalived
systemctl start keepalived

# add to /etc/sysctl.conf (keepalived)

cat >> /etc/sysctl.conf << EOF
net.ipv4.ip_nonlocal_bind=1
net.ipv4.tcp_fin_timeout = 30
net.ipv4.tcp_syncookies = 1
EOF

sysctl -p

# modify /etc/sysconfig/rsyslog
# add -r option

# modify /etc/rsyslog.conf
cat >> /etc/rsyslog.conf << EOF
local2.*                       /var/log/haproxy.log
EOF

