# readme

Debug a golang service launched using docker compose or a docker swarm.

## building

Not x-platform or multi-stage.

You will have to change aardvarkllc to your own account to generate the service image.

```bash
./build.sh
```

## running

### docker compose

Run `compose.sh` to launch the service.
Set the 'host' in launch.json to 127.0.0.1 then launch the debugger using "Remote golang debug in Docker container". Once attached, you can set a breakpoint then instruct the debugger to run the service.

### docker swarm

Run `swarm.sh` to deploy the stack to the swarm.
It may be necessary to open the swarm node's firewall to access port 2345. On Red Hat variants:

```bash
# optionally append '--permanent'
sudo firewall-cmd --add-port=2345/tcp
```

Run `de-swarm.sh` to remove the stack.