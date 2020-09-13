# Setup Service Account

A service account should be created to allow chaosengine to run experiments in your application namespace.

1. First let's store the RBAC yaml and update its namespace to the one we are using i.e `nginx`

```
wget https://hub.litmuschaos.io/api/chaos/1.7.0?file=charts/generic/pod-delete/rbac.yaml
```

2. Get the exact name of the yaml file that we just downloaded and rename it to a more friendly one

```
ls
```

Expected Output
```
'1.7.0?file=charts%2Fgeneric%2Fpod-delete%2Frbac.yaml'   Desktop   katacoda-finished
```

3. Rename it

```
mv 1.7.0?file=charts%2Fgeneric%2Fpod-delete%2Frbac.yaml rbac.yaml
```

4. Open the RBAC to edit all the namepaces and replace them with `nginx`

```
vi rbac.yaml
```

5. Once the yaml is opened up in Vim Editor, type the following command to replace all the default namespaces with `nginx`

```
:%s/default/nginx/g
```

and then save and exit

```
:wq
```
