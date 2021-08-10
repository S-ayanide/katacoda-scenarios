<br>

### Install Litmus ChaosCenter in your cluster

`kubectl apply -f https://litmuschaos.github.io/litmus/2.0.0-Beta/litmus-2.0.0-Beta.yaml`{{execute}}

### Verify Your Installation

Once all the CRDs are applied you can verify the installation by

- Checking the pods in the namespace where you installed Litmus:

  `watch kubectl get pods -n litmus`{{execute}}

  <span style={{color: 'green'}}>**Expected Output**</span>

  ```bash
  NAME                                    READY   STATUS  RESTARTS  AGE
  litmusportal-frontend-97c8bf86b-mx89w   1/1     Running 2         6m24s
  litmusportal-server-5cfbfc88cc-m6c5j    2/2     Running 2         6m19s
  mongo-0                                 1/1     Running 0         6m16s
  ```

- Checking the services running in the namespace where you installed Litmus:

  `kubectl get svc -n litmus`{{execute}}

  <span style={{color: 'green'}}>**Expected Output**</span>

  ```bash
  NAME                            TYPE        CLUSTER-IP      EXTERNAL-IP PORT(S)                       AGE
  litmusportal-frontend-service   NodePort    10.100.105.154  <none>      9091:30229/TCP                7m14s
  litmusportal-server-service     NodePort    10.100.150.175  <none>      9002:30479/TCP,9003:31949/TCP 7m8s
  mongo-service                   ClusterIP   10.100.226.179  <none>      27017/TCP                     7m6s
  ```
