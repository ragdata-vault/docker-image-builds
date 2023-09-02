#!/usr/bin/env bash

DOCKER_BUILDER=docker-image-builder

while getopts "h?H:p:" opt; do
	case "$opt" in
		h|\?)
			show_help
			exit 0
			;;
		H)	HOST="-H $OPTARG"
			;;
		p)	DOCKERFILE="$OPTARG"
			;;
	esac
done

if [ -z "$PATH" ]; then
    echo "Option -p (PATH) not specified"
    exit 1
fi

${DOCKER_BUILDER} ${HOST} \
		--images-name-prefix "build-php-" \
		--final-image-name "php:build" \
		--remove-builds \
		first \
		${DOCKERFILE}
