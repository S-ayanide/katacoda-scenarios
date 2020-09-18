<br>

## Setting up Nginx

<br>

We are going to apply Chaos to `nginx` in this scenario. You can apply chaos to any other application but for this scenario we are going to consider `nginx` as the application that we're going to apply chaos on.

> You might need to wait for a few seconds to a minute for your dev environment to set up.

**Next Let's deploy the nginx app on the default namespace**

`kubectl create deploy nginx --image=nginx`{{execute}}

<span style="color:green">**Expected Output**</span>

```bash
deployment.apps/nginx created
```

**Verify if the pods are in running state**

`kubectl get pods --show-labels`{{execute}}

You should be able to see something similar to this with a different hash attached to your pod label.

<span style="color:green">**Expected Output**</span>

```bash
nginx-86c57db685-vpr22   1/1   Running   0   3m15s   app=nginx,pod-template-hash=86c57db685
```
