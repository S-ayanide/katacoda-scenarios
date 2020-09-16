<br>

## Apply the LitmuChaos Operator manifest

<br>

```bash
kubectl apply -f https://litmuschaos.github.io/litmus/litmus-operator-v1.7.0.yaml
```

The above command installs all the CRDs, required service account configuration, and chaos-operator.

Check the available namespaces and see if `litmus` is present or not

```bash
kubectl get namespaces
```

You should be able to see litmus as an active namespace that you just created.
