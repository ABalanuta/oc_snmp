sudo dpkg-divert --package oc-snmp --remove --rename /etc/snmp/snmpd.conf
systemctl stop snmpd.service
