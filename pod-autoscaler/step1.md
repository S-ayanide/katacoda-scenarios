<br>

## Setting up Nginx

<br>

We are going to scale the application replicas and test autoscaling on an `nginx` container in this scenario. You can apply chaos to any other application but for this scenario we are going to consider `nginx` as the application that we're going to apply autoscaling on.

> You might need to wait for a few seconds to a minute for your dev environment to set up. Typically it requires around 1 minute or less for Katacoda to set up the cloud environment.

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
