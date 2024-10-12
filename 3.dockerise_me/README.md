## How to build and Run
A makefile is provided with one target to build the docker file of the application. build the docker image locally using this command
```bash
make build
```

To run the application, another target is defined in the makefile. Run this command to locally run the application using docker
```bash
make run
```

The `Makefile` script also defines targets for Podman users, use the commands below to build and run with Pod. The assumption is that the user has already initialized and started a Podman machine.

```bash
make pdbuild
```
To run the application with Podman, run the command below;
```bash
make pdrun
```
