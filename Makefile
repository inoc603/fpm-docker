.PHONY: alpine
alpine: Dockerfile.alpine

.PHONY: centos
centos: Dockerfile.centos

.PHONY: phony
phony:

Dockerfile.%: phony
	docker build -t fpm-docker-$* -f $@ .

push/%:
	docker tag fpm-docker-$* inoc603/fpm:$*
	docker push inoc603/fpm:$*

push: push/alpine push/centos
