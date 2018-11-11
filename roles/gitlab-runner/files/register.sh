#!/usr/bin/env bash
set -e

if [[ "$1" == "" ]]; then
    echo "no token given"
    exit 1
fi

if [[ "$2" == "" ]]; then
    printf "no url given"
    exit 1
fi

if [[ "$3" == "" ]]; then
    printf "no runner name given"
    exit 1
fi

TOKEN=$1
URL=$2
RUNNER_NAME=$3

echo "Check if runner is already registered..."
RUNNER_COUNT=$(cat /etc/gitlab-runner/config.toml | grep 'name = "docker-runner"' | wc -l)
echo "$RUNNER_COUNT are registered"

if [[ "$RUNNER_COUNT" == 0 ]]; then
    echo "Register runner..."

    gitlab-runner register \
                --non-interactive \
                --url $2 \
                --registration-token $1 \
                --executor "docker" \
                --docker-image docker:latest \
                --docker-volumes /var/run/docker.sock:/var/run/docker.sock \
                --docker-privileged \
                --description $3 \
                --tag-list "docker" \
                --run-untagged \
                --locked="false"

    echo "Runner registered successfully"
    exit 0
fi

echo "runner $RUNNER_NAME already registered"
exit 0


