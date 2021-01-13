<br>

## Apply the LitmuChaos Operator manifest

<br>

You can download the command to apply the latest manifest version by executing

`wget https://raw.githubusercontent.com/S-ayanide/katacoda-scenarios/master/container-kill/latest_version.sh && chmod +x latest_version.sh && ./latest_version.sh > apply.txt`{{execute}}

This will download the latest apply command locally and you can use this to apply the latest manifest

`kubectl apply -f $cat apply.txt`{{execute}}

Or you can directly use this command, but the version is a static example one

`kubectl apply -f https://litmuschaos.github.io/litmus/litmus-operator-v1.11.0.yaml`{{execute}}

The above command installs all the CRDs, required service account configuration, and chaos-operator.

<span style="color:green">**Expected Output**</span>

```bash
namespace/litmus created
serviceaccount/litmus created
clusterrole.rbac.authorization.k8s.io/litmus created
clusterrolebinding.rbac.authorization.k8s.io/litmus created
deployment.apps/chaos-operator-ce created
customresourcedefinition.apiextensions.k8s.io/chaosengines.litmuschaos.io created
customresourcedefinition.apiextensions.k8s.io/chaosexperiments.litmuschaos.io created
customresourcedefinition.apiextensions.k8s.io/chaosresults.litmuschaos.io created
```

Check the available namespaces and see if `litmus` is present or not

`kubectl get namespaces`{{execute}}

You should be able to see litmus as an active namespace that you just created.

<br />