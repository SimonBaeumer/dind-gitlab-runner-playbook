FROM jdeathe/centos-ssh:centos-7

RUN yum -y install initscripts && yum clean all

CMD ["/usr/bin/supervisord", "--configuration=/etc/supervisord.conf"]