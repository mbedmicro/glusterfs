FROM centos:centos6


RUN yum --setopt=tsflags=nodocs -y update
RUN yum --setopt=tsflags=nodocs -y install wget
RUN rpm -Uvh http://download.newrelic.com/pub/newrelic/el5/i386/newrelic-repo-5-3.noarch.rpm
RUN wget http://download.gluster.org/pub/gluster/glusterfs/LATEST/CentOS/glusterfs-epel.repo -O /etc/yum.repos.d/glusterfs-epel.repo
RUN yum --setopt=tsflags=nodocs -y install glusterfs glusterfs-server glusterfs-fuse glusterfs-geo-replication glusterfs-cli glusterfs-api attr nfs-utils newrelic-sysmond
RUN yum clean all

RUN nrsysmond-config --set license_key=086d6236e9bb2e38dda07e372ea4a2930f115d39

RUN mkdir -p /mnt/brick

ADD start-gluster.sh /

CMD /bin/sh start-gluster.sh

#EXPOSE 22 111 245 443 24007 2049 8080 6010 6011 6012 38465 38466 38468 38469 49152 49153 49154 49156 49157 49158 49159 49160 49161 49162
