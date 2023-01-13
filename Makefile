#!/usr/bin/env make
.PHONY: run_website stop_website, install_app

run_website:
	docker build -t explorecalifornia.com . && \
		docker run -p 5000:80 -d --name explorecalifornia.com --rm explorecalifornia.com

stop_website:
	docker stop explorecalifornia.com

install_app: 
	helm upgrade --atomic --install marv-website ./chart

uninstall_app:
	helm uninstall marv-website