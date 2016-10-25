FROM ubuntu

RUN apt-get update && \ 
	apt-get install -y wget && \
	echo "deb http://www.rabbitmq.com/debian/ testing main" | tee /etc/apt/sources.list.d/rabbitmq.list && \
	wget -O- https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | apt-key add - && \
	apt-get update && \ 
	apt-get install -y rabbitmq-server && \
	/usr/sbin/rabbitmq-plugins enable --offline rabbitmq_management rabbitmq_management_agent rabbitmq_management_visualiser rabbitmq_federation rabbitmq_federation_management 

ENV DOCKERIZE_VERSION v0.2.0

ADD rabbitmq.config /etc/rabbitmq/rabbitmq.config
ADD erlang.cookie /var/lib/rabbitmq/.erlang.cookie

RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

RUN chmod u+rw /etc/rabbitmq/rabbitmq.config && \
	chown rabbitmq:rabbitmq /var/lib/rabbitmq/.erlang.cookie && \
	chmod 400 /var/lib/rabbitmq/.erlang.cookie && \
	mkdir /opt/rabbit 

ADD run.sh /opt/rabbit/

RUN chmod a+x /opt/rabbit/run.sh

EXPOSE 5672
EXPOSE 15672
EXPOSE 25672
EXPOSE 4369
EXPOSE 9100
EXPOSE 9101
EXPOSE 9102
EXPOSE 9103
EXPOSE 9104
EXPOSE 9105

CMD /opt/rabbit/run.sh