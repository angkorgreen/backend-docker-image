LOCAL_CONTAINER=backend-docker-image:latest
REMOTE_CONTAINER=docker.pkg.github.com/angkorgreen/backend-docker-image/backend-docker-image:latest

main: build tag

build:
		@echo Building image
		@docker build \
			--pull \
			--rm \
			-f Dockerfile \
			-t ${LOCAL_CONTAINER} \
			.
tag:
		@docker tag \
			${LOCAL_CONTAINER} \
			${REMOTE_CONTAINER}
		@echo Successfully tagged ${REMOTE_CONTAINER}
