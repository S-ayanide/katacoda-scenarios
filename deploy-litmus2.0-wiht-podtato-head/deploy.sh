#!/bin/bash

until kubectl config view | grep -mq 1 "http"; do echo "Waiting for Kubernetes to setup" && sleep 5 ; done

kubectl apply -f https://raw.githubusercontent.com/litmuschaos/litmus/2.5.0/mkdocs/docs/2.5.0/litmus-2.5.0.yaml
kubectl apply -f https://raw.githubusercontent.com/litmuschaos/test-tools/master/custom/workflow-helper/app-deployer/app-manifest/resilient-podtato-head.yaml
clear
echo "Installing Litmus 2.0 and Podtato Head"