#!/bin/bash

function join_cluster {
	dockerize -wait tcp://$CLUSTER_WITH:25672 -timeout 250s
	rabbitmqctl stop_app
	if [ -z "$RAM_NODE" ]; then
		rabbitmqctl join_cluster rabbit@$CLUSTER_WITH
	else
		rabbitmqctl join_cluster --ram rabbit@$CLUSTER_WITH
	fi
	rabbitmqctl start_app
}

if [ -z "$CLUSTERED" ] || [ -z "$CLUSTER_WITH" ]; then
	echo 'Starting non-clustered node...'
else
	echo "Starting clustered node ($CLUSTER_WITH)..."
	sleep 10
	join_cluster &
fi


/usr/sbin/rabbitmq-server

