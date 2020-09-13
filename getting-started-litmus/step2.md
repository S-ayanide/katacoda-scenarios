1. Verify if the chaos operator is running

```
kubectl get pods -n litmus
```

**Expected Output:**
```
chaos-operator-ce-<numericId>-<id> 1/1 Running 0
```

2. Verify if chaos CRDs are installed

```
kubectl get crds | grep chaos
```

**Expected Output:**
```
chaosengines.litmuschaos.io 2020-09-13T18:45:25Z

chaosexperiments.litmuschaos.io 2020-09-13T18:45:26Z

chaosresults.litmuschaos.io 2020-09-13T18:45:26Z
```

3. Verify if the chaos api resources are successfully created in the desired (application) namespace

```
kubectl api-resources | grep chaos
```

**Expected Output:**
```
chaosengines litmuschaos.io true ChaosEngine

chaosexperiments litmuschaos.io true ChaosExperiment

chaosresults litmuschaos.io true ChaosResult
```
