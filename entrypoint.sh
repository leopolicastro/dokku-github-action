#!/bin/sh -l

if [ -z "$SSH_PRIVATE_KEY" ]; then
	>&2 echo "Set SSH_PRIVATE_KEY environment variable"
	exit 1
fi

echo "Private key $SSH_PRIVATE_KEY"

mkdir -p ~/.ssh
echo "$SSH_PRIVATE_KEY" | tr -d '\r' > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
ssh-keyscan -t rsa "$SSH_HOST" >> ~/.ssh/known_hosts

git push "$SCRIPT"