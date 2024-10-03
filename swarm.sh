#!/bin/bash

export USER=dja
export SWARM_NODE=192.168.68.64

# it is first necessary to copy the ssh public key to the remote server
# ssh-copy-id dja@red

DOCKER_HOST=ssh://${USER}@${SWARM_NODE} docker stack deploy --detach=false --compose-file ./docker-swarm-stack.yml --resolve-image always --with-registry-auth test-hydra