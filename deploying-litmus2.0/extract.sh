#!/bin/bash

while getopts "n:" arg; do
  case $arg in
    n) Namespace=$OPTARG;;
  esac
done

IP="$(minikube ip)"
FrontendServiceNodePort="$(kubectl describe svc litmusportal-frontend-service -n $Namespace | grep NodePort: | grep -oE "[[:digit:]]{1,}")"
ChaosCenter="$IP:$FrontendServiceNodePort"
echo "ChaosCenter is available at $ChaosCenter"