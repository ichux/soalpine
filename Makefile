# Do not remove this block. It is used by the 'help' rule when
# constructing the help output.
# help:
# help: Viable help
# help:

.PHONY: help
# help: help				- Please use "make <target>" where <target> is one of
help:
	@grep "^# help\:" Makefile | sed 's/\# help\: //' | sed 's/\# help\://'

.PHONY: build
# help: build 				- Build the image
build:
	@echo "Y" | docker builder prune
	@docker-compose up -d --build

.PHONY: log
# help: log 				- Container logs
log:
	@docker logs --follow nc_app`

.PHONY: sh
# help: sh 				- sh for the container
sh:
	@docker exec -it nc_app sh