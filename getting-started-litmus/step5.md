<br>

## Setup Service Account

<br>

A service account should be created to allow chaosengine to run experiments in your application namespace.

**First let's store the RBAC yaml and update its namespace to the one we are using i.e `nginx`**

```bash
wget https://hub.litmuschaos.io/api/chaos/1.7.0?file=charts/generic/pod-delete/rbac.yaml
```

**Get the exact name of the yaml file that we just downloaded and rename it to a more friendly one**

```bash
ls
```

<span style="color:green">**Expected Output**</span>

```bash
'1.7.0?file=charts%2Fgeneric%2Fpod-delete%2Frbac.yaml'   Desktop   katacoda-finished
```

**Rename it**

```bash
mv 1.7.0?file=charts%2Fgeneric%2Fpod-delete%2Frbac.yaml rbac.yaml
```

**Open the RBAC to edit all the namepaces and replace them with `nginx`**

```bash
vi rbac.yaml
```

**Once the yaml is opened up in Vim Editor, type the following command to replace all the default namespaces with `nginx`**

```bash
:%s/default/nginx/g
```

and then save and exit

```bash
:wq
```
