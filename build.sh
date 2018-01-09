#!/bin/bash

_grafana_tag=$1
_grafana_version=${_grafana_tag:1}

if [ "$_grafana_version" != "" ]; then
	echo "Building version ${_grafana_version}"
	docker build \
		--tag "107025123061.dkr.ecr.us-west-1.amazonaws.com/grafana:${_grafana_version}" \
		--no-cache=true .
else
	echo "Building latest for master"
	docker build \
		--build-arg DOWNLOAD_URL=https://s3-us-west-2.amazonaws.com/grafana-releases/master/grafana_latest_amd64.deb \
		--tag "grafana/grafana:master" \
		--no-cache=true .
fi
