IMAGE_NAME=local/akcom-udpechod
CONTAINER_NAME=akcom-udpechod

build:
	docker build -t $(IMAGE_NAME) .

run:
	docker run -d -it -p 30006:30006/udp --name=$(CONTAINER_NAME) $(IMAGE_NAME)

bash:
	docker exec -it $(CONTAINER_NAME) bash

man:
	docker exec -it $(CONTAINER_NAME) sh -c "man akcom-udpechod"

test:
	docker exec -it $(CONTAINER_NAME) sh -c "akcom-udpecho 127.0.0.1"

start:
	docker start $(CONTAINER_NAME)

stop:	
	docker stop $(CONTAINER_NAME)

rm:	stop
	docker rm $(CONTAINER_NAME)
