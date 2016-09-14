DC := docker-compose

all:

update:
	$(DC) down --rmi local; $(DC) up

# docker rm -fv $(docker ps -aq)