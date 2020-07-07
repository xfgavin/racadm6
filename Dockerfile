FROM ubuntu:trusty

RUN echo 'deb http://linux.dell.com/repo/community/ubuntu trusty openmanage/740' >/etc/apt/sources.list.d/linux.dell.com.sources.list \
    && gpg --keyserver pool.sks-keyservers.net --recv-key 1285491434D8786F \
    && apt-get -qq update \
    && apt-get -qq install -y --force-yes srvadmin-idracadm \
    && apt-get -qq clean \
    && apt-get -qq autoclean
ENTRYPOINT ["/opt/dell/srvadmin/sbin/racadm"]
