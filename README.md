Kubernetes Blue-Green Deployment (k3s / kubeadm / EKS)

This repo provides a complete Blue-Green deployment setup using:
- Two Deployments: web-blue and web-green
- One Service (NodePort): web
Traffic switching is done by changing the Service selector from blue -> green.

Folder Structure
- k8s/: Kubernetes manifests (namespace, configmaps, deployments, service, networkpolicy)
- scripts/: helper scripts to switch traffic and test

Prerequisites
- Kubernetes cluster (k3s recommended)
- kubectl configured to access the cluster

Quick Start

1) Apply manifests:
kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/configmap-blue.yaml
kubectl apply -f k8s/configmap-green.yaml
kubectl apply -f k8s/deployment-blue.yaml
kubectl apply -f k8s/deployment-green.yaml
kubectl apply -f k8s/service.yaml

(Optional) Apply NetworkPolicy (requires CNI that supports it):
kubectl apply -f k8s/networkpolicy.yaml

2) Check status:
./scripts/status.sh

3) Access the app:
- Service is NodePort 30080
- Open in browser: http://<NODE_IP>:30080

4) Switch traffic to GREEN:
./scripts/switch-to-green.sh

5) Switch back to BLUE:
./scripts/switch-to-blue.sh

6) Smoke test:
./scripts/smoke-test.sh <NODE_IP> 30080

Notes
- In service.yaml, default selector routes traffic to BLUE.
- Blue/Green versions serve different HTML via ConfigMaps so you can clearly confirm traffic switch.
