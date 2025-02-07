From ubuntu:latest

RUN apt-get update
RUN apt-get -y install python3 python3-pip
RUN mkdir /opt/app
COPY src/* /opt/app/
COPY requirements.txt /opt/app/
RUN pip3 install -r /opt/app/requirements.txt
COPY docker-entrypoint.sh /

Expose 5000
ENTRYPOINT "/docker-entrypoint.sh"
