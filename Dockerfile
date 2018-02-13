#This is a comment
FROM centos:latest
MAINTAINER Docker Newbee <yuchi.chen@acer.com>
# by default, time zone is UTC.Change timeone to PDS
RUN mv /etc/localtime /etc/localtime.bak
RUN ln -s /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
#Install vim package
RUN yum install -y vim
#Setup sudoers
RUN yum install -y sudo
RUN echo "peter  ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
RUN echo "steven ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
RUN echo "jake   ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
RUN echo "paul   ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
RUN echo "ryan   ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
RUN echo "bernie ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
RUN echo "jeremi ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
#Setup History to rsyslog
RUN echo -e "#History to rsyslog\nfunction log2syslog\n{\n\tlogger -p local1.notice -t bash -i -- $USER$(who -u am i 2>/dev\null | awk '{print " ["$1$NF"]"}'):$(fc -ln -0) \\n}\ntrap log2syslog DEBUG" >> /etc/profile
#Bash History add date and time
RUN echo "HISTTIMEFORMAT='%F %T '" >> ~/.bashrc
RUN echo "HISTFILESIZE=5000" >> ~/.bashrc
RUN source ~/.bashrc
#IPA Client (Centos)Install
RUN echo "34.231.176.31 ipa.byoc.acer.com" >> /etc/hosts
RUN echo "test2-mgr.byoc.acer.com" > /etc/hostname
#RUN yum -y install ipa-client
#RUN ipa-client-install -p admin -w Free@route --hostname test2-mgr.byoc.acer.com --enable-dns-updates --mkhomedir --domain=byoc.acer.com --server=ipa.byoc.acer.com

