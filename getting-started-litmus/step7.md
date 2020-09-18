<br>

## Prepare ChaosEngine

<br>

**Check the current number of the Pods**

<br>

You would only be able to see the `nginx` pod in running state.

`kubectl get pods`{{execute}}

<span style="color:green">**Expected Output:**</span>

```
nginx-86c57db685-vd8k6   1/1     Running   0         <TimeStamp>
```

<br>

**Explore the ChaosEngine yaml**

ChaosEngine connects the application instance to a Chaos Experiment.

Explore the ChaosEngine yaml [https://hub.litmuschaos.io/generic/pod-delete](https://hub.litmuschaos.io/generic/pod-delete)

## Run Chaos

<br>

**Apply the ChaosEngine manifest to trigger the experiment.**

`kubectl apply -f https://hub.litmuschaos.io/api/chaos/1.8.0?file=charts/generic/pod-delete/engine.yaml`{{execute}}

<span style="color:green">**Expected Output:**</span>

```bash
chaosengine.litmuschaos.io/nginx-chaos created
```

<br>

**Check the health of the Pod**

<br>

You would be able to see that two new pods

-   `nginx-chaos-runner`
-   `pod-delete-<hash>`

would be created and age would be the latest time stamp. You'd be able to see the status of the pods changing from `Running` to `ContainerCreating` to `Completed` to`Terminating` based on the chaos applied.

`watch -n 1 kubectl get pods`{{execute}}

<span style="color:green">**Expected Output:**</span>

```
nginx-86c57db685-wbdj5    1/1     Running     0          <TimeStamp>
nginx-chaos-runner        1/1     Running     0          <TimeStamp>
pod-delete-tkwb3x-9g789   0/1     Completed   0          <TimeStamp>
```
