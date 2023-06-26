FROM shoothzj/base

COPY docker-build /opt/kerberos

ENV KERBEROS_HOME=/opt/kerberos

RUN apt-get update && \
    apt-get install -y krb5-kdc krb5-admin-server && \
    apt-get clean all && \
    mkdir /opt/kerberos/conf && \
    mkdir /opt/kerberos/logs && \
    touch /etc/krb5kdc/kadm5.acl && \
    ln -s /etc/krb5kdc/kdc.conf /opt/kerberos/conf/kdc.conf && \
    ln -s /etc/krb5.conf /opt/kerberos/conf/krb5.conf && \
    lv -s /etc/krb5kdc/kadm5.acl && \

WORKDIR /opt/kerberos

CMD ["/usr/bin/dumb-init", "bash", "-vx", "/opt/kerberos/scripts/start.sh"]
