<br>

## Install Chaos Experiments

Chaos experiments contain the actual chaos details. These experiments are installed on your cluster as Kubernetes CRs. The Chaos Experiments are grouped as Chaos Charts and are published on [Chaos Hub](https://hub.litmuschaos.com).

In this scenario we are going to try one of our most popular experiments i.e `pod-delete`.

> You can deviate from this step and try out your own experiments from our list of experiments provided at Chaos Hub but we would suggest you stick with this tutorial to get a depper understanding first and later move on to try something yourself.

For the sake of this tutorial we are going to move forward with the `generic/pod-delete` experiment from [Chaos Hub](https://hub.litmuschaos.com).

**Experiment Details:** [https://hub.litmuschaos.io/generic/pod-delete](https://hub.litmuschaos.io/generic/pod-delete)

1. Install the Chaos Experiment using the following command

```bash
kubectl apply -f https://hub.litmuschaos.io/api/chaos/1.7.0?file=charts/generic/pod-delete/experiment.yaml -n nginx
```

**Expected Output:**

```bash
chaosexperiment.litmuschaos.io/pod-delete created
```

2. Verify if the chaos experiments are installed

```bash
kubectl get chaosexperiments -n nginx
```

**Expected Output:**

```bash
pod-delete   10s
```
