<br>

## Observe and Verify Chaos

<br>

**Observe the Chaos results**

<br>

<span style="color:green">ChaosResult CR name will be `<chaos-engine-name>-<chaos-experiment-name>`</span>

`kubectl describe chaosresult nginx-chaos-pod-delete`{{execute}}

Describe the ChaosResult CR to know the status of each experiment. The `status.verdict` is set to `Awaited` when the experiment is in progress, eventually changing to either `Pass` or `Fail`.

<br>

> If you receive an `Error from server (NotFound): chaosresults.litmuschaos.io "nginx-chaos-pod-delete" not found` response from the server, wait for a minutes and try again. It takes a little bit of time for the Chaos Engine to run.

<span style="color:green">**Expected Output:**</span>

```bash
Name:         nginx-chaos-pod-delete
Namespace:    nginx
Labels:       name=nginx-chaos-pod-delete
Annotations:  <none>
API Version:  litmuschaos.io/v1alpha1
Kind:         ChaosResult
Metadata:
  Creation Timestamp:  <Your Creation Timestamp>
  Generation:          2
  Resource Version:    1335
  Self Link:           /apis/litmuschaos.io/v1alpha1/namespaces/nginx/chaosresults/nginx-chaos-pod-delete
  UID:                 b9d9e27c-786d-4203-aef7-f99e3412b041
Spec:
  Engine:      nginx-chaos
  Experiment:  pod-delete
Status:
  Experimentstatus:
    Fail Step:  N/A
    Phase:      Completed
    Verdict:    Pass
Events:
  Type    Reason   Age   From                     Message
  ----    ------   ----  ----                     -------
  Normal  Summary  2s    pod-delete-e2pdaa-fpwjm  pod-delete experiment has been Passed
```

<br>

_Incase you want to try running chaos on a separate image or namespace, check out the [official documentation](https://docs.litmuschaos.io/docs/getstarted/) and get your chaos experiments up and running in minutes_

<br>
