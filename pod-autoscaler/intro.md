<br>

<h1 align="center">
  <img src="https://raw.githubusercontent.com/litmuschaos/website-litmuschaos/staging/src/images/LitmusLogo.png" alt="LitmusChaos" width="200">
</h1>

<br>

## **Container Kill** 😮😎

| Type       | Description     | Tested K8s Platform |
| :------------- | :----------: | -----------: | 
| Generic | Kill one container in the application pod | GKE, Packet(Kubeadm), Minikube, EKS, AKS |

Container kill contains chaos to disrupt state of kubernetes resources. Experiments can inject random container delete failures against specified application.

* Executes SIGKILL on containers of random replicas of an application deployment.
* Tests deployment sanity (replica availability & uninterrupted service) and recovery workflows of the application pod.

<br>

---

<br>
Litmus takes a cloud-native approach to create, manage and monitor chaos. Chaos is orchestrated using the following Kubernetes Custom Resource Definitions (**CRDs**):

-   **ChaosEngine**: A resource to link a Kubernetes application or Kubernetes node to a ChaosExperiment. ChaosEngine is watched by Litmus' Chaos-Operator which then invokes Chaos-Experiments
-   **ChaosExperiment**: A resource to group the configuration parameters of a chaos experiment. ChaosExperiment CRs are created by the operator when experiments are invoked by ChaosEngine.
-   **ChaosResult**: A resource to hold the results of a chaos-experiment. The Chaos-exporter reads the results and exports the metrics into a configured Prometheus server.

## **Experiment Details:**


* `litmus` LIB Details:
    * It supports docker, containerd and crio container runtime.
    * It can kill the container of multiple pods in parallel (can be tuned by `PODS_AFFECTED_PERC` env).
    * Containers are killed using the `docker kill` in docker runtime and `crictl stop` command in containerd or crio runtime.
    * container-kill is run as a pod on the application node. It have ability to kill the application containers multiple times. Which can be varied by `TOTAL_CHAOS_DURATION` and `CHAOS_INTERVAL`.

* `pumba` LIB Details:
    * It support only docker container runtime.
    * It can kill the container of multiple pods in parallel (can be tuned by PODS_AFFECTED_PERC env). It kill the container by sending SIGKILL termination signal to its docker socket (hence docker runtime is required).
    * Containers are killed using the kill command provided by `pumba`.
    * Pumba is run as a pod on the application node. It have ability to kill the application containers multiple times. Which can be varied by TOTAL_CHAOS_DURATION and CHAOS_INTERVAL.
* Tests deployment sanity (replica availability & uninterrupted service) and recovery workflow of the application
* Good for testing recovery of pods having side-car containers

## **In this scenario you will learn how to:**

-   Setup and install Litmus onto Kubernetes.
-   Install Container Kill Chaos experiment, RBAC and prepare the Chaos Engine.
-   Deliver the chaos experiments.
-   Observe the chaos engine exercise your experiments and verify your result.

## **Container Kill Demo** 📹

<br>

[!<img src = 'https://i.ibb.co/X43Q283/container-kill.png' width='400'/>](https://youtu.be/XKyMNdVsKMo)

<br>
