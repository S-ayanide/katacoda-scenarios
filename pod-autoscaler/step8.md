<br>

## Observe and Verify Chaos

<br>

**Observe the Chaos results**

<br>

<span style="color:green">ChaosResult CR name will be `<chaos-engine-name>-<chaos-experiment-name>`</span>

`kubectl describe chaosresult nginx-chaos-container-kill`{{execute}}

Describe the ChaosResult CR to know the status of each experiment. The `status.verdict` is set to `Awaited` when the experiment is in progress, eventually changing to either `Pass` or `Fail`.

<br>

> If you receive an `Error from server (NotFound): chaosresults.litmuschaos.io "nginx-chaos-container-kill" not found` response from the server, wait for a minutes and try again. It takes a little bit of time for the Chaos Engine to run.

<span style="color:green">**Expected Output:**</span>

```bash
Name:         nginx-chaos-container-kill
Namespace:    default
Labels:       app.kubernetes.io/component=experiment-job
              app.kubernetes.io/part-of=litmus
              app.kubernetes.io/version=1.11.1
              chaosUID=869eb23b-aed2-44eb-89ee-5e4bb457ea51
              controller-uid=22d767c7-996e-414c-8cbe-41d945db214a
              job-name=container-kill-48vw7t
              name=nginx-chaos-container-kill
Annotations:  <none>
API Version:  litmuschaos.io/v1alpha1
Kind:         ChaosResult
Metadata:
  Creation Timestamp:  2020-12-30T05:23:41Z
  Generation:          2
  Resource Version:    1141
  Self Link:           /apis/litmuschaos.io/v1alpha1/namespaces/default/chaosresults/nginx-chaos-container-kill
  UID:                 e7ca3165-6d57-4614-a9a1-ce210833acc6
Spec:
  Engine:      nginx-chaos
  Experiment:  container-kill
Status:
  Experimentstatus:
    Fail Step:                 N/A
    Phase:                     Completed
    Probe Success Percentage:  100
    Verdict:                   Pass
Events:
  Type    Reason   Age   From                         Message
  ----    ------   ----  ----                         -------
  Normal  Awaited  2m8s  container-kill-e2pdaa-fpwjm  experiment: container-kill, Result: Awaited
  Normal  Pass     86s   container-kill-e2pdaa-fpwjm  experiment: container-kill, Result: Pass
```

<br>

_Incase you want to try running chaos on a separate image or namespace, check out the [official documentation](https://docs.litmuschaos.io/docs/getstarted/) and get your chaos experiments up and running in minutes_

<br>

## <span style="color:green">**Congratulations! You have successfully executed your chaos experiment with Litmus**</span>

**Click on Continue to Finish this Scenario**