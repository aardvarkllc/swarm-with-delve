#!/bin/bash

export USER=user
export SWARM_NODE=192.0.0.0

# it is first necessary to copy the ssh public key to the remote server
# ssh-copy-id dja@red

DOCKER_HOST=ssh://${USER}@${SWARM_NODE} docker stack deploy --detach=false --compose-file ./docker-swarm-stack.yml --resolve-image always --with-registry-auth test