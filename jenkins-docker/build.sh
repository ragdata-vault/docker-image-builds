#!/usr/bin/env bash

DOCKER_BUILDER=docker-image-builder

while getopts "h?H:d:j:" opt; do
	# shellcheck disable=SC2213
	case "$opt" in
		h|\?)
			show_help
			exit 0
			;;
		H)	HOST="-H $OPTARG"
			;;
		d)	DOCKER_DOCKERFILE="$OPTARG"
			;;
		j)	JENKINS_DOCKERFILE="$OPTARG"
			;;
		*)	;;
	esac
done

if [ -z "$DOCKER_DOCKERFILE" ]; then
    echo "Option -d (PATH) not specified"
    exit 1
fi

if [ -z "$JENKINS_DOCKERFILE" ]; then
    echo "Option -j (PATH) not specified"
    exit 1
fi


${DOCKER_BUILDER} ${HOST} \
		--images-name-prefix "build-jenkins-" \
		--final-image-name "jenkins:build" \
		--remove-builds \
		first \
		${DOCKER_DOCKERFILE} \
		${JENKINS_DOCKERFILE}
