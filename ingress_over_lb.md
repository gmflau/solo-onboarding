#### Example of defining an Ingress on top of a K8 load balancer service

```
kubectl apply -f- <<EOF
  apiVersion: networking.k8s.io/v1
  kind: Ingress
  metadata:
    name: example
    namespace: gloo-system
  spec:
    ingressClassName: nginx
    rules:
      - host: "localhost"    
        http:
          paths:
            - pathType: Prefix
              backend:
                service:
                  name: gloo-fed-console
                  port:
                    number: 8090
              path: /
EOF
```

```
kubectl port-forward svc/ingress-nginx-controller -n default 8081:80
```

Point your brower:
```
http://localhost:8081
```


