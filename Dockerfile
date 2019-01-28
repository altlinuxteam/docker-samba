FROM alt:sisyphus

RUN apt-get update && apt-get -y install apt rpm && apt-get -y dist-upgrade && apt-get clean

RUN apt-get -y install bind-utils krb5-kinit ldb-tools samba-DC-common samba-DC samba-DC-client
RUN rm -f /etc/samba/smb.conf
RUN mkdir /var/lock/subsys
COPY resolv.conf /etc/resolv.conf
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh
#RUN samba-tool domain provision --domain=DOMAIN --host-name=dc0 --adminpass=peebieY4 --use-rfc2307 --realm=DOMAIN.ALT

ENTRYPOINT ["/startup.sh"]
