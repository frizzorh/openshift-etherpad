#!/bin/bash
export VERSION=2.3.2
podman build --tag etherpad-ocp:2.3.2 .
#podman tag quay.io/gpte-devops-automation/etherpad:${VERSION} quay.io/gpte-devops-automation/etherpad:latest
podman push quay.io/gpte-devops-automation/etherpad:2.3.2-ocp
#podman push quay.io/gpte-devops-automation/etherpad:latest
#git tag ${VERSION}
#git push origin ${VERSION}
