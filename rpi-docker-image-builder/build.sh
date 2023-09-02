#!/usr/bin/env bash

DOCKER_BUILDER=docker-image-builder

while getopts "h?H:" opt; do
	case "$opt" in
	h|\?)
		show_help
		exit 0
		;;
	H)	HOST="-H $OPTARG"
		;;
	esac
done

${DOCKER_BUILDER} ${HOST} \
		--images-name-prefix "build-dib-" \
		--final-image-name "docker-image-builder:build" \
		--remove-builds \
		first \
		../docker-image-builder
