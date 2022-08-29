FROM centos:8

ARG root_passwd=xikunlun
ARG centos_version=7.8
ARG build_date=2020-11-19

LABEL org.label-schema.name="centos" \
      org.label-schema.build-date="${build_date}" \
      org.label-schema.version="${centos_version}" \
      org.label-schema.schema-version="1.0" \
      maintainer="peaksong"

ENV ROOT_PASSWD=$root_passwd
COPY resource/Centos-8.repo /tmp/

ENTRYPOINT ["/sbin/init"]
CMD ["systemctl start sshd"]

RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup \
 && mv /etc/yum.repos.d/CentOS-AppStream.repo /etc/yum.repos.d/CentOS-AppStream.repo.backup \
 && mv /etc/yum.repos.d/CentOS-Extras.repo /etc/yum.repos.d/CentOS-Extras.repo.backup \
 && mv /etc/yum.repos.d/CentOS-PowerTools.repo /etc/yum.repos.d/CentOS-PowerTools.repo.backup \
 && mv /etc/yum.repos.d/CentOS-centosplus.repo /etc/yum.repos.d/CentOS-centosplus.repo.backup \
 && mv /tmp/Centos-8.repo /etc/yum.repos.d/CentOS-Base.repo \
 && dnf clean all \
 && ls -a /etc/yum.repos.d/ \
 && dnf makecache \
 && dnf install -y epel-release \
 && mv /etc/yum.repos.d/epel.repo /etc/yum.repos.d/epel.repo.backup \
 && mv /etc/yum.repos.d/epel-testing.repo /etc/yum.repos.d/epel-testing.repo.backup \
 && dnf install -y https://mirrors.aliyun.com/epel/epel-release-latest-8.noarch.rpm \
 && sed -i 's|^#baseurl=https://download.fedoraproject.org/pub|baseurl=https://mirrors.aliyun.com|' /etc/yum.repos.d/epel* \
 && sed -i 's|^metalink|#metalink|' /etc/yum.repos.d/epel* \
 && dnf install openssh* passwd cracklib-dicts -y \
 && echo "${ROOT_PASSWD}" \
 && echo "root:${ROOT_PASSWD}"| chpasswd \
 && dnf install -y wget gcc-c++ automake autoconf libtool make openssl-devel bzip2-devel libffi-devel \
 && dnf groupinstall -y 'Development Tools' \
 && echo "end of the RUN script"

VOLUME ["/centos"]
