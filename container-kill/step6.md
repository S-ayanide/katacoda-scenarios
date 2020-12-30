<br>

## Annotate your application

<br>

Your application has to be annotated with `litmuschaos.io/chaos="true"`. As a security measure, and also as a means to reduce blast radius the chaos operator checks for this annotation before invoking chaos experiment(s) on the application.

`kubectl annotate deploy/nginx litmuschaos.io/chaos="true"`{{execute}}
