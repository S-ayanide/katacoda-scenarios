#!/bin/bash
IP="$(minikube ip)"
FrontendServiceNodePort="$(kubectl describe svc litmusportal-frontend-service -n litmus | grep NodePort: | grep -oE "[[:digit:]]{1,}")"
export ChaosCenter="$IP:$FrontendServiceNodePort"
