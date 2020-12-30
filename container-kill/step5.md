<br>

## Setup Service Account

<br>

A service account should be created to allow chaosengine to run experiments in your application namespace. Below there is a sample RBAC manifest to create a chaosServiceAccount in the default namespace(Can be modified to apply to any desired namespace).

This RBAC consists of the minimum necessary role permissions to execute the experiment.

**Apply the RBAC**

`kubectl apply -f https://hub.litmuschaos.io/api/chaos/1.11.1?file=charts/generic/container-kill/rbac.yaml`{{execute}}

To customize or download the yaml use the RBAC link below:

`https://hub.litmuschaos.io/api/chaos/1.11.1?file=charts/generic/container-kill/rbac.yaml`{{execute}}

<span style="color:green">**Expected Output**</span>

```bash
serviceaccount/container-kill-sa created
role.rbac.authorization.k8s.io/container-kill-sa created
rolebinding.rbac.authorization.k8s.io/container-kill-sa created
```

> Note: In case of restricted systems/setup, create a PodSecurityPolicy(psp) with the required permissions. The chaosServiceAccount can subscribe to work around the respective limitations. An example of a standard psp that can be used for litmus chaos experiments can be found [here](https://docs.litmuschaos.io/docs/next/litmus-psp/).