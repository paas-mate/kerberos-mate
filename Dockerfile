FROM shoothzj/base

RUN apt-get update && \
    apt-get install -y krb5-server krb5-libs krb5-auth-dialog krb5-workstation && \
    apt-get clean all

CMD["/usr/sbin/init"]
