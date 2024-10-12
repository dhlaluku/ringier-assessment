version=1.0

build:
	export DOCKER_BUILDKIT=1
	docker buildx build -t web-app:${version} .

run:
	docker run -p 8080:8080 web-app:${version}

##### For Podman, use the targets defined below ######
pdbuild:
	export DOCKER_BUILDKIT=1
	podman buildx build -t web-app:${version} .

pdrun:
	podman run -p 8080:8080 web-app:${version}
