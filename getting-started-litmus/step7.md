<br>

## Prepare ChaosEngine

ChaosEngine connects the application instance to a Chaos Experiment.

1. First let's store the ChaosEngine yaml and update update the values of `applabel` , `appns`, and `namespace`. You can update the values of `applabel` , `appns`, `appkind` and `experiments` as per your choice.

```bash
wget https://hub.litmuschaos.io/api/chaos/1.7.0?file=charts/generic/pod-delete/engine.yaml
```

2. Get the exact name of the yaml file that we just downloaded and rename it to a more friendly one

```bash
ls
```

Expected Output

```bash
'1.7.0?file=charts%2Fgeneric%2Fpod-delete%2Fengine.yaml'   Desktop   katacoda-finished   rbac.yaml
```

3. Rename it

```bash
mv 1.7.0?file=charts%2Fgeneric%2Fpod-delete%2Fengine.yaml chaosEngine.yaml
```

4. Open the Chaos Engine Yaml to edit all the namepaces, applables and other values

```bash
vi chaosEngine.yaml
```

5. Once the yaml is opened up in Vim Editor, override the default Chaos Experiments Variables.

```bash
metadata:
  name: nginx-chaos
  namespace: nginx
```

```bash
spec:
  appinfo:
    appns: 'nginx'
```

and then save and exit

```bash
:wq
```
