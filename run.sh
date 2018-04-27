#!/bin/bash
docker run \
  -it \
  --rm \
  --name "bs" \
  -v $(pwd)/$1:/script.sh \
  bs bash
