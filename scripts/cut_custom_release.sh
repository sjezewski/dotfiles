#!/bin/bash

TAG=`git log | head -n1 | cut -f 2 -d " "`
echo "build tag $TAG"
VERSION=1.7.3

make docker-build && docker tag pachyderm/pachd:latest pachyderm/pachd:$VERSION-$TAG && docker tag pachyderm/worker:latest pachyderm/worker:$VERSION-$TAG && docker push pachyderm/pachd:$VERSION-$TAG && docker push pachyderm/worker:$VERSION-$TAG



