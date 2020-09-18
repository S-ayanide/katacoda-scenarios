<br>

## Setup Service Account

<br>

A service account should be created to allow chaosengine to run experiments in your application namespace.

**Apply the RBAC**

`kubectl apply -f https://hub.litmuschaos.io/api/chaos/1.8.0?file=charts/generic/pod-delete/rbac.yaml`{{execute}}

<span style="color:green">**Expected Output**</span>

```bash
serviceaccount/pod-delete-sa created
role.rbac.authorization.k8s.io/pod-delete-sa created
rolebinding.rbac.authorization.k8s.io/pod-delete-sa created
```
