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

Explore the ChaosEngine yaml [https://hub.litmuschaos.io/api/chaos/1.11.1?file=charts/generic/container-kill/engine.yaml](https://hub.litmuschaos.io/api/chaos/1.11.1?file=charts/generic/container-kill/engine.yaml)

* Provide the application info in `spec.appinfo`
* Override the experiment tunables if desired in `experiments.spec.components.env`
* To understand the values to provided in a ChaosEngine specification, refer [ChaosEngine Concepts](https://docs.litmuschaos.io/docs/chaosengine/)

> Note: Ensure that the CHAOS_INTERVAL used in the experiment is fairly high (i.e., enough time is provided for app recovery). Else, it can cause an exponential increase in the backOff delay, causing the app to stay in CrashLoopBackOff state for much longer'

**Experiment Tunables**

| Variables       | Description     | Specify In ChaosEngine     | Notes     |
| :------------- | :----------: | -----------: | -----------: |
| TARGET_CONTAINER | The name of container to be killed inside the pod  | Optional    | If the TARGET_CONTAINER is not provided it will delete the first container  |
| CHAOS_INTERVAL | Time interval b/w two successive container kill (in sec)	 | Optional    | If the CHAOS_INTERVAL is not provided it will take the default value of 10s |
| TOTAL_CHAOS_DURATION | The time duration for chaos injection (seconds)  | Optional  | Defaults to 20s |
| PODS_AFFECTED_PERC | The Percentage of total pods to target  | Optional    | Defaults to 0 (corresponds to 1 replica), provide numeric value only |
| TARGET_PODS | Comma separated list of application pod name subjected to container kill chaos  | Optional    | If not provided, it will select target pods randomly based on provided appLabels |
| LIB_IMAGE	 | LIB Image used to kill the container  | Optional  | Defaults to `litmuschaos/go-runner:1.11.0` |
| LIB | The category of lib use to inject chaos	  | Optional  | Default value: litmus, supported values: pumba and litmus |
| RAMP_TIME | Period to wait before injection of chaos in sec	| Optional  |  |
| SEQUENCE | It defines sequence of chaos execution for multiple target pods  | Optional  | Default value: parallel. Supported: serial, parallel |
| SOCKET_PATH | Path of the containerd/crio/docker socket file  | Optional  | Defaults to `/var/run/docker.sock` |
| CONTAINER_RUNTIME | Container runtime interface for the cluster  | Optional  | Defaults to docker, supported values: docker, containerd and crio for litmus and only docker for pumba LIB |
| INSTANCE_ID | A user-defined string that holds metadata/info about current run/instance of chaos. Ex: 04-05-2020-9-00. This string is appended as suffix in the chaosresult CR name.	  | Optional  | Ensure that the overall length of the chaosresult CR is still < 64 characters |

## Run Chaos

<br>

**Apply the ChaosEngine manifest to trigger the experiment.**

`kubectl apply -f https://hub.litmuschaos.io/api/chaos/1.11.1?file=charts/generic/container-kill/engine.yaml`{{execute}}

<span style="color:green">**Expected Output:**</span>

```bash
chaosengine.litmuschaos.io/nginx-chaos created
```

<br>

**Check the health of the Pod**

<br>

You would be able to see that two new pods

-   `nginx-chaos-runner`
-   `container-kill-<hash>`

would be created and age would be the latest time stamp. You'd be able to see the status of the pods changing from `Running` to `ContainerCreating` to `Completed` to`Terminating` based on the chaos applied. And the container on which it's applied transitioning from `Running` to `Error` to `CrashLoopBackOff` to `Running` again if your container is resilient.

`watch -n 1 kubectl get pods`{{execute}}

<span style="color:green">**Expected Output:**</span>

```
nginx-86c57db685-wbdj5    1/1     Running     0          <TimeStamp>
nginx-chaos-runner        1/1     Running     0          <TimeStamp>
container-kill-e2pdaa-fpwjm   0/1     Completed   0          <TimeStamp>
```

**Keep a check on the restart count**

Each time the container-kill executes your container(`nginx-86c57db685-wbdj5` in this case) would go down and restart back up if it is resilient enough. Keep a check on the number of times the container is restarted and note the state transition from `Error` to `Running`.