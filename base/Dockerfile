FROM ubuntu
MAINTAINER Ilya Isaev me@ilyaisaev.com

RUN apt-get update && \ 
	apt-get install -y wget && \
	echo "deb http://www.rabbitmq.com/debian/ testing main" | tee /etc/apt/sources.list.d/rabbitmq.list && \
	wget -O- https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | apt-key add - && \
	apt-get update && \ 
	apt-get install -y rabbitmq-server && \
	/usr/sbin/rabbitmq-plugins enable --offline rabbitmq_management rabbitmq_management_agent rabbitmq_management_visualiser rabbitmq_federation rabbitmq_federation_management 