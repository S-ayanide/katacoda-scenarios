#!/bin/bash

until kubectl get pods | grep -m 1 "resources"; do sleep 1 ; done

echo "Rest of it"