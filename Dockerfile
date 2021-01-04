FROM alpine:3.12.0

RUN apk update && apk add \
  openldap \
  openldap-clients \
  openldap-back-mdb

RUN mkdir -p /run/openldap

COPY ./slapd.conf /etc/openldap/
COPY ./custom.schema /etc/openldap/schema/custom.schema
COPY ./seed.ldif /root/
COPY ./boot.sh /root/

#RUN /usr/bin/ldapadd -x -D 'cn=Manager,dc=my-domain,dc=com' -w secret -f /root/seed.ldif

#ENTRYPOINT ["/usr/sbin/slapd", "-d", "3"]
ENTRYPOINT ["/root/boot.sh"]
