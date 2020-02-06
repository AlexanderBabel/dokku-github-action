#!/bin/bash -e

if [ -z "$PRIVATE_KEY" ]; then
	>&2 echo "Set PRIVATE_KEY environment variable"
	exit 1
fi

ssh_host=$(echo $URL | sed 's/.*@//' | sed 's/[:/].*//')
if [ -z "$ssh_host" ]; then
	>&2 echo "Set URL environment variable e.g.: <user@git.host:project | ssh://user@git.host:port/project>"
	exit 1
fi

ssh_port=
if [[ $URL =~ ^ssh://[^/]+:([0-9]+) ]]; then
        ssh_port="-p ${BASH_REMATCH[1]}"
fi

mkdir -p ~/.ssh
echo "$PRIVATE_KEY" | tr -d '\r' > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
ssh-keyscan -H $ssh_port "$ssh_host" >> ~/.ssh/known_hosts
echo ~/.ssh/known_hosts

git push $URL ${CI_COMMIT_SHA:-HEAD}:refs/heads/${DEPLOY_BRANCH:-master} $([ -z "$DISABLE_FORCE_PUSH" ] && echo --force)