#!/bin/bash

if [ -z "$CLUSTERED" ]; then
	/usr/sbin/rabbitmq-server -detached
else
	if [ -z "$CLUSTER_WITH" ]; then
		/usr/sbin/rabbitmq-server -detached
	else
		#clean folder with data before joining cluster
		rm -rf /var/lib/rabbitmq/*
		dockerize -wait tcp://$CLUSTER_WITH:25672 -timeout 250s

		/usr/sbin/rabbitmq-server -detached
		
		rabbitmqctl stop_app
		if [ -z "$RAM_NODE" ]; then
			rabbitmqctl join_cluster rabbit@$CLUSTER_WITH
		else
			rabbitmqctl join_cluster --ram rabbit@$CLUSTER_WITH
		fi
		rabbitmqctl start_app
	fi
fi
sleep 60 && echo "Ilya we need to fix logging..."
tail -f /var/log/rabbitmq/*
