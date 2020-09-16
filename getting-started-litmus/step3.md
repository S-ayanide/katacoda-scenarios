<br>

## Verifying the Litmus Installation

<br>

**Verify if the chaos operator is running**

```bash
kubectl get pods -n litmus
```

<span style="color:green">**Expected Output:**<span>

```bash
chaos-operator-ce-<numericId>-<id> 1/1 Running 0
```

**Verify if chaos CRDs are installed**

```bash
kubectl get crds | grep chaos
```

<span style="color:green">**Expected Output:**</span>

```bash
chaosengines.litmuschaos.io 2020-09-13T18:45:25Z

chaosexperiments.litmuschaos.io 2020-09-13T18:45:26Z

chaosresults.litmuschaos.io 2020-09-13T18:45:26Z
```

**Verify if the chaos api resources are successfully created in the desired (application) namespace**

```bash
kubectl api-resources | grep chaos
```

<span style="color:green">**Expected Output:**</span>

```bash
chaosengines litmuschaos.io true ChaosEngine

chaosexperiments litmuschaos.io true ChaosExperiment

chaosresults litmuschaos.io true ChaosResult
```
