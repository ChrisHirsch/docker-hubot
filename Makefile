IMAGE=chrishirsch/docker-hubot
CONTAINER=docker-hubot

build: clean
		docker build --rm --tag "$(IMAGE)" .

clean:
	@docker rm -f $(CONTAINER) 2>/dev/null |:

shell: build
	docker run -P --rm --tty --interactive --entrypoint /bin/bash "$(IMAGE)" 

push: build
	docker push "$(IMAGE)"

