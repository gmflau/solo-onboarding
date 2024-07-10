#!/bin/bash

set -ex

gcloud container clusters create $1 \
  --spot \
  --zone=$2 --num-nodes=3 \
  --image-type=COS_CONTAINERD \
  --machine-type=e2-standard-8 \
  --network=default \
  --enable-ip-alias \
  --enable-stackdriver-kubernetes \
  --labels=created-by=gilbert_lau,team=customer-success,purpose=development
