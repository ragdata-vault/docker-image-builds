FROM resin/rpi-raspbian

RUN apt-get -y update \
	&& apt-get -y install rsyslog

RUN ln -s /etc/rsyslog.conf /etc/rsyslog.d/50-default.conf
