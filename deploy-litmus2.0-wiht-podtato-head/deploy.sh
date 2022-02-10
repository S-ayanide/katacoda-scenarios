#!/bin/bash
echo "Please wait for a minute while we install all the necessary services"

until kubectl config view | grep -m 1 "http"; do echo "Waiting for Kubernetes to setup" && sleep 20 ; done

sleep 5
kubectl apply -f https://raw.githubusercontent.com/litmuschaos/litmus/2.5.0/mkdocs/docs/2.5.0/litmus-2.5.0.yaml
sleep 5
kubectl apply -f https://raw.githubusercontent.com/litmuschaos/test-tools/master/custom/workflow-helper/app-deployer/app-manifest/resilient-podtato-head.yaml
sleep 5
clear
echo "Installing Litmus 2.0 and Podtato Head"
sleep 10
FrontendServiceNodePort="$(kubectl describe svc litmusportal-frontend-service -n litmus | grep NodePort: | grep -oE "[[:digit:]]{1,}")"
echo "ChaosCenter is available at PORT $FrontendServiceNodePort"