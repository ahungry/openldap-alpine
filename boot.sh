#!/bin/sh

/usr/sbin/slapd -d 3 >/root/ldap.log 2>&1  &

sleep 3

/usr/bin/ldapadd -x -D 'cn=Manager,dc=my-domain,dc=com' -w secret -f /root/seed.ldif

/usr/bin/tail -f /root/ldap.log
