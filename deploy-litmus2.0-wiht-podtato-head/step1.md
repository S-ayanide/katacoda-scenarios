<br />

To setup and login to ChaosCenter expand the available services just created and copy the `PORT` of the `litmusportal-frontend-service` service

Once you have the PORT copied in your clipboard, simply use your `IP` and `PORT` in this manner `<NODEIP>:<PORT>` to access the Litmus ChaosCenter.

**In this scenario we have already done that for you and you can simply use the PORT provided on the terminal to the right to access the ChaosCenter by visiting the Dashboard Panel and entering the PORT in the `Display Port` section**

## Credentials for ChaosCenter

You should be able to see the Login Page of Litmus ChaosCenter. The default credentials are

```bash
Username: admin
Password: litmus
```

### To do the step manually

Expand your service using

`kubectl get svc -n litmus`{{execute}}

<span style="color:green">**Expected Output**</span>

```bash
NAME                            TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)                         AGE
chaos-litmus-portal-mongo       ClusterIP   10.104.107.117   <none>        27017/TCP                       2m
litmusportal-frontend-service   NodePort    10.101.81.70     <none>        9091:30385/TCP                  2m
litmusportal-server-service     NodePort    10.108.151.79    <none>        9002:32456/TCP,9003:31160/TCP   2m
```

> **Note:** In this case, the PORT for litmusportal-frontend-service is `30385`. Yours will be different.

Extract the IP, in this case we are on a minikube cluster so simple execute
`minikube ip`{{execute}}

And concatenate the two to get your public ChaosCenter URL. For example, `http://172.17.0.3:30385/`

> Where `172.17.0.3` is my `NodeIP` and `30385` is the `frontend service PORT`. If using a LoadBalancer, the only change would be to provide a `<LoadBalancerIP>:<PORT>`. [Learn more about how to access ChaosCenter with LoadBalancer](https://litmusdocs-beta.netlify.app/docs/next/user-guides/setup-without-ingress#with-loadbalancer.md)
