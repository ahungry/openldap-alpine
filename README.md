# OpenLDAP Alpine

Small sample of running OpenLDAP instance in Alpine.

## Installation

Clone this repo and adjust the basic setup files.

```sh
docker build -t alpine:openldap . -f Dockerfile
```

```sh
docker run --rm -it -p389:389 alpine:openldap
```

## Usage
Test it works with:

```sh
ldapsearch -LLL -x -h localhost -p 389 -b 'cn=mcarter,ou=Users,dc=my-domain,dc=com' -D 'cn=Manager,dc=my-domain,dc=com' -w secret '(objectClass=*)'
```
