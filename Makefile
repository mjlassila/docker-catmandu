IMAGES := $(shell docker images -f "dangling=true" -q)
CONTAINERS := $(shell docker ps -a -q -f status=exited)
CONT := catmandu
PWD=$(shell pwd)


build:
	docker build -t mjlassila/catmandu .

create_network:
	docker network create --driver bridge gp

run:
	docker run -d --name catmandu -p 8100:80 --restart unless-stopped --net=gp mjlassila/catmandu

stop:
	docker stop $(CONT)
	
remove:
	docker stop $(CONT)
	docker rm  $(CONT)

restart:
	docker restart $(CONT)


bash:
	docker exec -it $(CONT) bash

clean:
	docker rm -f $(CONTAINERS)
	docker rmi -f $(IMAGES)



.PHONY: build create_network run stop remove run_mysql restart bash clean
