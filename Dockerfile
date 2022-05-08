FROM ubuntu:latest

RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ precise main universe" >> /etc/apt/source.list
RUN apt-get update
RUN apt-get -y install rsyslog
RUN apt -y install rsyslog-gnutls ca-certificates

ADD ./newrelic.conf /etc/rsyslog.d/newrelic.conf
ADD ./rsyslog.conf /etc/rsyslog.conf
ADD ./sample.log /var/log/sample.log

EXPOSE 514
# ENTRYPOINT ["rsyslogd"]