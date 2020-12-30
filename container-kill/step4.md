<br>

## Install Container Kill Experiments

<br>

Container kill contains chaos to disrupt state of kubernetes resources. Experiments can inject random container delete failures against specified application.

Executes SIGKILL on containers of random replicas of an application deployment.
Tests deployment sanity (replica availability & uninterrupted service) and recovery workflows of the application pod.

You can find more Chaos Experiments on [Chaos Hub](https://hub.litmuschaos.com).

**Experiment Details:** [https://hub.litmuschaos.io/generic/pod-delete](https://hub.litmuschaos.io/generic/pod-delete)

<br>

* litmus LIB Details:
    * It supports docker, containerd and crio container runtime.
    * It can kill the container of multiple pods in parallel (can be tuned by `PODS_AFFECTED_PERC` env).
    * Containers are killed using the `docker kill` in docker runtime and `crictl stop` command in containerd or crio runtime.
    * container-kill is run as a pod on the application node. It have ability to kill the application containers multiple times. Which can be varied by `TOTAL_CHAOS_DURATION` and `CHAOS_INTERVAL`.

* pumba LIB Details:
    * It support only docker container runtime.
    * It can kill the container of multiple pods in parallel (can be tuned by PODS_AFFECTED_PERC env). It kill the container by sending SIGKILL termination signal to its docker socket (hence docker runtime is required).
    * Containers are killed using the kill command provided by `pumba`.
    * Pumba is run as a pod on the application node. It have ability to kill the application containers multiple times. Which can be varied by TOTAL_CHAOS_DURATION and CHAOS_INTERVAL.
* Tests deployment sanity (replica availability & uninterrupted service) and recovery workflow of the application
* Good for testing recovery of pods having side-car containers

**Integrations**

Container kill supports `litmus` and `pumba` LIB. The container runtime can be choose via setting CONTAINER_RUNTIME env. supported values: `docker`, `containerd`, `crio`. The desired pumba and litmus image can be configured in the env variable `LIB_IMAGE`.

**Install the Chaos Experiment using the following command**

`kubectl apply -f https://hub.litmuschaos.io/api/chaos/1.11.1?file=charts/generic/container-kill/experiment.yaml`{{execute}}

<span style="color:green">**Expected Output:**</span>

```bash
chaosexperiment.litmuschaos.io/container-kill created
```

**Verify if the chaos experiments are installed**

`kubectl get chaosexperiments`{{execute}}

<span style="color:green">**Expected Output:**</span>

```bash
container-kill   <Creation Timestamp>
```
