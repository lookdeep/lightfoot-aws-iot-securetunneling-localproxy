#!/bin/bash
#
#

echo "building docker image..."
docker build -f Dockerfile.lookdeep-build -t ld-aws-localproxy-builder .

echo "running container to extract localproxy..."
docker run --rm -d --name ld-localproxy-extractor -t ld-aws-localproxy-builder tail -f /dev/null

echo "copying localproxy to host..."
docker cp ld-localproxy-extractor:localproxy/build/bin/localproxy ./

echo "stopping container..."
docker stop ld-localproxy-extractor

echo "build complete"
