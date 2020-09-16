<br>

## Setting up Nginx 

We are going to apply Chaos to `nginx` in this scenario. You can apply chaos to any other application but for this scenario we are going to consider `nginx` as the application that we're going to apply chaos on.

**Let's start by creating a namespace**

```bash
kubectl create namespace nginx
```

**Next Let's deploy the nginx app on the namespace we just created**

```bash
 kubectl create deploy nginx -n nginx --image=nginx
```
