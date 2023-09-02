FROM python:3

RUN apt-get -y update && apt-get -y install \
	screen \
	vim

RUN pip3 install docker-image-builder

CMD /bin/bash
