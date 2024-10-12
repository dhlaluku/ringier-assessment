version=5.0

build:
	export DOCKER_BUILDKIT=1
	docker buildx build -t node-app:${version} .

run:
	docker run -p 8080:8080 node-app:${version}

##### For Podman, use the targets defined below ######
pdbuild:
	export DOCKER_BUILDKIT=1
	podman buildx build -t node-app:${version} .

pdrun:
	podman run -p 8080:8080 node-app:${version}

