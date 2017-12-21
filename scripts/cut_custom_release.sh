#!/bin/bash

TAG=`git log | head -n1 | cut -f 2 -d " "`
echo "build tag $TAG"

make docker-build && docker tag pachyderm/pachd:latest pachyderm/pachd:1.6.5-$TAG && docker tag pachyderm/worker:latest pachyderm/worker:1.6.5-$TAG && docker push pachyderm/pachd:1.6.5-$TAG && docker push pachyderm/worker:1.6.5-$TAG



