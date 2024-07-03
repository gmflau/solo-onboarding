#### k3d vs kind 

##### Difference in load balancer services:

**k3d:**    
```
❯ kubectl get svc -n gloo-system
NAME               TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S) 
rate-limit         ClusterIP      10.43.157.52    <none>        18081/TCP                                              7h20m
gloo-fed-console   ClusterIP      10.43.54.13     <none>        10101/TCP,8090/TCP,8081/TCP                            7h20m
extauth            ClusterIP      10.43.223.162   <none>        8083/TCP                                               7h20m
redis              ClusterIP      10.43.180.95    <none>        6379/TCP                                               7h20m
gloo               ClusterIP      10.43.3.14      <none>        9977/TCP,9976/TCP,9988/TCP,9966/TCP,9979/TCP,443/TCP   7h20m
gateway-proxy      LoadBalancer   10.43.185.119   172.28.0.3    80:32742/TCP,443:30050/TCP                             7h20m
gloo-proxy-http    LoadBalancer   10.43.43.91     172.28.0.3    8080:30380/TCP                                         7h19m
```
    
**kind with Metal LB:**
```
❯ kubectl get svc -n gloo-system                
NAME               TYPE           CLUSTER-IP     EXTERNAL-IP    PORT(S)                                                AGE
extauth            ClusterIP      10.1.215.118   <none>         8083/TCP                                               6h55m
gateway-proxy      LoadBalancer   10.1.86.19     172.27.101.1   80:30541/TCP,443:30942/TCP                             6h55m
gloo               ClusterIP      10.1.22.81     <none>         9977/TCP,9976/TCP,9988/TCP,9966/TCP,9979/TCP,443/TCP   6h55m
gloo-fed-console   ClusterIP      10.1.67.45     <none>         10101/TCP,8090/TCP,8081/TCP                            6h55m
gloo-proxy-http    LoadBalancer   10.1.18.37     172.27.101.2   8080:31599/TCP                                         6h54m
gloo-proxy-https   LoadBalancer   10.1.97.210    172.27.101.3   443:30278/TCP                                          6h51m
rate-limit         ClusterIP      10.1.7.75      <none>         18081/TCP                                              6h55m
redis              ClusterIP      10.1.199.160   <none>         6379/TCP                                               6h55m
```
    
The built-in load balancer service from k3d hands the same EXTERNAL-IP address for k8 LoadBalancer services.
    



