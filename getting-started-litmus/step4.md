<br>

## Install Chaos Experiments

<br>

Chaos experiments contain the actual chaos details. These experiments are installed on your cluster as Kubernetes CRs. The Chaos Experiments are grouped as Chaos Charts and are published on [Chaos Hub](https://hub.litmuschaos.com).

In this scenario we are going to try one of our most popular experiments i.e `pod-delete`.

> You can deviate from this step and try out your own experiments from our list of experiments provided at Chaos Hub but we would suggest you stick with this tutorial to get a deeper understanding first and later move on to try something yourself.

For the sake of this tutorial we are going to move forward with the `generic/pod-delete` experiment from [Chaos Hub](https://hub.litmuschaos.com).

**Experiment Details:** [https://hub.litmuschaos.io/generic/pod-delete](https://hub.litmuschaos.io/generic/pod-delete)

<br>

**Install the Chaos Experiment using the following command**

```bash
kubectl apply -f https://hub.litmuschaos.io/api/chaos/1.8.0?file=charts/generic/pod-delete/experiment.yaml
```

<span style="color:green">**Expected Output:**</span>

```bash
chaosexperiment.litmuschaos.io/pod-delete created
```

**Verify if the chaos experiments are installed**

```bash
kubectl get chaosexperiments
```

<span style="color:green">**Expected Output:**</span>

```bash
pod-delete   <Creation Timestamp>
```
