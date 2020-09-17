<br>

## Prepare ChaosEngine

<br>

ChaosEngine connects the application instance to a Chaos Experiment.

**Explore the ChaosEngine yaml**

```bash
vi https://hub.litmuschaos.io/api/chaos/1.7.0?file=charts/generic/pod-delete/engine.yaml
```

Once you are happy with the experiments specified you can use `:q` to exit vim

You can update the values of `applabel` , `appns`, `appkind` and `experiments` as per your experiment requirements and namespaces.

## Run Chaos

<br>

**Apply the ChaosEngine manifest to trigger the experiment.**

```bash
kubectl apply -f https://hub.litmuschaos.io/api/chaos/1.7.0?file=charts/generic/pod-delete/engine.yaml
```

<span style="color:green">**Expected Output:**</span>

```bash
chaosengine.litmuschaos.io/nginx-chaos created
```
