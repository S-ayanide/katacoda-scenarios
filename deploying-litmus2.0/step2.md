<br>

### Add the litmus helm repository

`helm repo add litmuschaos https://litmuschaos.github.io/litmus-helm/`{{execute}}

> You can check the `litmuschaos` repository by running `helm repo list`

### Create the namespace on which you want to install Litmus ChaosCenter

The litmus infra components will be placed in this namespace.

> The ChaosCenter can be placed in any namespace, but for this scenario we are choose `litmus` as the namespace.

`kubectl create ns litmus`{{execute}}

### Install Litmus ChaosCenter

`helm install --name chaos litmuschaos/litmus-2-0-0-beta --namespace=litmus --devel`{{execute}}

<span style="color:green">**Expected Output**</span>

```bash
NAME: chaos
LAST DEPLOYED: Tue Jun 15 19:20:09 2021
NAMESPACE: litmus
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
Thank you for installing litmus-2-0-0-beta 😀

Your release is named chaos and its installed to namespace: litmus.

Visit https://docs.litmuschaos.io/docs/getstarted/ to find more info.
```

> Litmus uses Kubernetes CRDs to define chaos intent. Helm3 handles CRDs better than Helm2. Before you start running a chaos experiment, verify if Litmus is installed correctly.

### Verify Your Installation

Once all the CRDs are applied you can verify the installation by

- Checking the pods in the namespace where you installed Litmus:

  `watch kubectl get pods -n litmus`{{execute}}

  <span style="color:green">**Expected Output**</span>

  ```bash
  NAME                                    READY   STATUS  RESTARTS  AGE
  litmusportal-frontend-97c8bf86b-mx89w   1/1     Running 2         6m24s
  litmusportal-server-5cfbfc88cc-m6c5j    2/2     Running 2         6m19s
  mongo-0                                 1/1     Running 0         6m16s
  ```

- Checking the services running in the namespace where you installed Litmus:

  `kubectl get svc -n litmus`{{execute}}

  <span style="color:green">**Expected Output**</span>

  ```bash
  NAME                            TYPE        CLUSTER-IP      EXTERNAL-IP PORT(S)                       AGE
  litmusportal-frontend-service   NodePort    10.100.105.154  <none>      9091:30229/TCP                7m14s
  litmusportal-server-service     NodePort    10.100.150.175  <none>      9002:30479/TCP,9003:31949/TCP 7m8s
  mongo-service                   ClusterIP   10.100.226.179  <none>      27017/TCP                     7m6s
  ```
