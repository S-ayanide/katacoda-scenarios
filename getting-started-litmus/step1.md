<br>

## Setting up Nginx

<br>

We are going to apply Chaos to `nginx` in this scenario. You can apply chaos to any other application but for this scenario we are going to consider `nginx` as the application that we're going to apply chaos on.

**Let's start by creating a namespace**

```bash
kubectl create namespace nginx
```

<span style="color:green">**Expected Output**</span>

```bash
namespace/nginx created
```

**Verify nginx namespace has been created**

```bash
kubectl get namespaces
```

You should be able to see `nginx` as an active namespace that you just created.

**Next Let's deploy the nginx app on the namespace we just created**

```bash
kubectl create deploy nginx -n nginx --image=nginx
```

<span style="color:green">**Expected Output**</span>

```bash
deployment.apps/nginx created
```

**Verify if the pods are in running state**

```bash
kubectl get pods -n nginx --show-labels
```

You should be able to see something similar to this with a different hash attached to your pod label.

<span style="color:green">**Expected Output**</span>

```bash
nginx-86c57db685-vpr22   1/1   Running   0   3m15s   app=nginx,pod-template-hash=86c57db685
```
