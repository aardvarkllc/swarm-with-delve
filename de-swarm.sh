#!/bin/bash

export USER=dja
export SWARM_NODE=192.168.68.64

# it is first necessary to copy the ssh public key to the remote server
# ssh-copy-id dja@red

DOCKER_HOST=ssh://${USER}@${SWARM_NODE} docker stack rm test-hydra