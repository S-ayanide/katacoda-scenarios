#!/bin/bash
clear
IP="$(minikube ip)"
FrontendServiceNodePort="$(kubectl describe svc litmusportal-frontend-service -n litmus | grep NodePort: | grep -oE "[[:digit:]]{1,}")"
ChaosCenter="$IP:$FrontendServiceNodePort"
clear
echo "ChaosCenter is available at PORT $FrontendServiceNodePort"

kubectl apply -f https://raw.githubusercontent.com/litmuschaos/litmus/2.5.0/mkdocs/docs/2.5.0/litmus-2.5.0.yaml
kubectl apply -f https://raw.githubusercontent.com/litmuschaos/test-tools/master/custom/workflow-helper/app-deployer/app-manifest/resilient-podtato-head.yaml
clear
echo "Litmus 2.0 and Podtato Head application is successfully deployed in this cluster"