<br />

To setup and login to ChaosCenter expand the available services just created and copy the `PORT` of the `litmusportal-frontend-service` service

Once you have the PORT copied in your clipboard, simply navigate to `Dashboard` in the Katacoda workspace and paste the `PORT` and hit `Display Port` to access the Litmus ChaosCenter.

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

Navigate to `Dashboard` in the Katacoda workspace and paste the `PORT` and hit `Display Port` to access the Litmus ChaosCenter.
