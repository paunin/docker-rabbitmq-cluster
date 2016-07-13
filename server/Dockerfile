FROM relaxart/rabbitmq-base
MAINTAINER Ilya Isaev me@ilyaisaev.com

ADD rabbitmq.config /etc/rabbitmq/rabbitmq.config
ADD erlang.cookie /var/lib/rabbitmq/.erlang.cookie

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