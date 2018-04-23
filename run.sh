#!/bin/bash
docker run \
  -it \
  --rm \
  --name "bs" \
  -v $(pwd)/test.sh:/test.sh \
  bs bash
