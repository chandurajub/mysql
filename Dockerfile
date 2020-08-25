FROM  centos:7
RUN   yum install epel-release -y
RUN   yum install mariadb bind-utils nc git -y
COPY  run.sh /tmp
CMD   sh /tmp/run.sh
