<br>

## Apply the LitmuChaos Operator manifest

<br>

`kubectl apply -f https://litmuschaos.github.io/litmus/litmus-operator-v1.11.0.yaml`{{execute}}

The above command installs all the CRDs, required service account configuration, and chaos-operator.

<span style="color:green">**Expected Output**</span>

```bash
namespace/litmus created
serviceaccount/litmus created
clusterrole.rbac.authorization.k8s.io/litmus created
clusterrolebinding.rbac.authorization.k8s.io/litmus created
deployment.apps/chaos-operator-ce created
customresourcedefinition.apiextensions.k8s.io/chaosengines.litmuschaos.io created
customresourcedefinition.apiextensions.k8s.io/chaosexperiments.litmuschaos.io created
customresourcedefinition.apiextensions.k8s.io/chaosresults.litmuschaos.io created
```

Check the available namespaces and see if `litmus` is present or not

`kubectl get namespaces`{{execute}}

You should be able to see litmus as an active namespace that you just created.

<br />

### Alternative Approach

You also get the option to install the LitmusChaos Manifest through Helm. If you are interested to do so, follow the steps below instead:

Helm comes in 2 parts: The `Helm CLI` which runs on client machines, and the `Tiller` application which runs in the Kubernetes cluster.

Upon initialization, Helm deploys leverages the `kubeconfig` on the machine to communicate with a Kubernetes cluster and deploy the Tiller application to that cluster. Tiller is used to translate charts in to Kubernetes resources, and maintains information about applications deployed through Helm.

#### Installing Helm

Helm comes pre-installed on these instances, otherwise it could be installed using:

`curl https://raw.githubusercontent.com/helm/helm/master/scripts/get | bash`{{execute}}

<span style="color:green">**Expected Output**</span>

```bash
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  7160  100  7160    0     0  40632      0 --:--:-- --:--:-- --:--:-- 40681
Helm v2.17.0 is available. Changing from version v2.13.1.
Downloading https://get.helm.sh/helm-v2.17.0-linux-amd64.tar.gz
Preparing to install helm and tiller into /usr/local/bin
helm installed into /usr/local/bin/helm
tiller installed into /usr/local/bin/tiller
Run 'helm init' to configure helm.
```

**Initialize Helm:**

`helm init`{{execute}}

<span style="color:green">**Expected Output**</span>

```bash
Creating /root/.helm
Creating /root/.helm/repository
Creating /root/.helm/repository/cache
Creating /root/.helm/repository/local
Creating /root/.helm/plugins
Creating /root/.helm/starters
Creating /root/.helm/cache/archive
Creating /root/.helm/repository/repositories.yaml
Adding stable repo with URL: https://charts.helm.sh/stable
Adding local repo with URL: http://127.0.0.1:8879/charts
$HELM_HOME has been configured at /root/.helm.

Tiller (the Helm server-side component) has been installed into your Kubernetes Cluster.

Please note: by default, Tiller is deployed with an insecure 'allow unauthenticated users' policy.
To prevent this, run `helm init` with the --tiller-tls-verify flag.
For more information on securing your installation see: https://v2.helm.sh/docs/securing_installation/
```

Helm automatically used the current Kubernetes context for initialization. By default Helm deploys Tiller to the `kube-system` namespace. 

**Add the LitmusChaos Helm repo**

`helm repo add litmuschaos https://litmuschaos.github.io/litmus-helm/`{{execute}}

<span style="color:green">**Expected Output**</span>

```bash
"litmuschaos" has been added to your repositories
```

**Create a Litmus namespace in Kubernetes**

`kubectl create ns litmus`{{execute}}

<span style="color:green">**Expected Output**</span>

```bash
namespace/litmus created
```

**Install the Litmus Helm chart**

`helm install chaos litmuschaos/litmus --namespace=litmus`{{execute}}

<span style="color:green">**Expected Output**</span>

```bash
NAME: chaos
LAST DEPLOYED: Fri Sep  29 06:19:50 2020
NAMESPACE: litmus
STATUS: deployed
REVISION: 1
TEST SUITE: None
```