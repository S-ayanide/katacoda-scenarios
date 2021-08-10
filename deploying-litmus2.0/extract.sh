#!/bin/bash
clear
IP="$(minikube ip)"
FrontendServiceNodePort="$(kubectl describe svc litmusportal-frontend-service -n litmus | grep NodePort: | grep -oE "[[:digit:]]{1,}")"
ChaosCenter="$IP:$FrontendServiceNodePort"
clear
echo "ChaosCenter is available at PORT $FrontendServiceNodePort"