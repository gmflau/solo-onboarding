#!/bin/bash

eksctl create cluster --name glau-dev-cluster1 \
--spot --version=1.29 \
--region us-east-1 --nodes 2 --nodes-min 0 --nodes-max 3 \
--instance-types t3.large \
--tags created-by=gilbert_lau,team=csa,purpose=customer-success
