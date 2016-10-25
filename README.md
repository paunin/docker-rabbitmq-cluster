This folder structure contains the Dockerfiles for building RabbitMQ cluster - the number of nodes are completely customizable using https://docs.docker.com/compose/[docker-compose] docker-compose.yml file.


Structure:
==========
There are 3 folders.

1. base - the base Dockerfile is based on an Ubuntu image with RabbitMQ installations.
2. server - This builds on the base image and has the startup script for bring up a RabbitMQ server
4. cluster - This contains a https://docs.docker.com/compose/[docker-compose] definition file(docker-compose.yml) for brining up the rabbitmq cluster. Use `docker-compose -f docker-compose.yml up` to bring up the cluster.


If needed, additional nodes can be added to this file. If the entire cluster comes up, the management console can be accessed at http://<dockerip>:15672

and connection host should look like this: `dockerip:5672,dockerip:5673,dockerip:5674`