# ☸️ Kubernetes (K8s) Command Cheat Sheet

![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white)
![Cheat Sheet](https://img.shields.io/badge/Cheat%20Sheet-v1.0-success?style=for-the-badge)

A quick-reference guide for the most common `kubectl` commands, organized by resource type.

## 📋 Table of Contents
- [Cluster Info & Context](#-cluster-info--context)
- [Pod Management](#-pod-management)
- [Deployments & Scaling](#-deployments--scaling)
- [Services & Networking](#-services--networking)
- [Configuration & Storage](#-configuration--storage)
- [Troubleshooting & Logs](#-troubleshooting--logs)

---

## 🌐 Cluster Info & Context
*View cluster details and switch between environments.*

| Command | Description |
| :--- | :--- |
| `kubectl cluster-info` | Display endpoint information about the master and services. |
| `kubectl version --short` | Check the Kubernetes client and server versions. |
| `kubectl config get-contexts` | List all available cluster contexts. |
| `kubectl config use-context <name>` | Switch to a different cluster context. |
| `kubectl api-resources` | List all available API resource types. |
| `kubectl get nodes` | List all nodes in the cluster. |

---

## 📦 Pod Management
*Create, list, and interact with individual Pods.*

| Command | Description |
| :--- | :--- |
| `kubectl get pods` | List all pods in the default namespace. |
| `kubectl get pods -A` | List pods in **all** namespaces. |
| `kubectl get pods -o wide` | List pods with more details (IP, Node). |
| `kubectl run <name> --image=<img >`| Create and run a specific image in a pod. |
| `kubectl describe pod <name>` | Show detailed configuration and events for a pod. |
| `kubectl delete pod <name>` | Delete a specific pod (gracefully). |
| `kubectl exec -it <pod> -- /bin/sh` | Open an interactive shell inside a running pod. |

---

## 🚀 Deployments & Scaling
*Manage application rollouts and replicas.*

| Command | Description |
| :--- | :--- |
| `kubectl get deployments` | List all deployments. |
| `kubectl create deployment <name> --image=<img >` | Create a new deployment using a specific image. |
| `kubectl scale deployment <name> --replicas=3` | Scale a deployment to 3 replicas. |
| `kubectl rollout status deployment/<name>` | Check the status of a rollout. |
| `kubectl rollout undo deployment/<name>` | Rollback to the previous deployment version. |
| `kubectl rollout history deployment/<name>` | View the rollout history. |
| `kubectl set image deployment/<name> <container>=<img>` | Update the image of a container (triggers a rollout). |

---

## 🔌 Services & Networking
*Expose applications and manage networking.*

| Command | Description |
| :--- | :--- |
| `kubectl get services` | List all services in the namespace. |
| `kubectl expose deployment <name> --port=80` | Expose a deployment as a ClusterIP service on port 80. |
| `kubectl port-forward <pod> 8080:80` | Forward local port 8080 to the pod's port 80. |
| `kubectl get ingress` | List Ingress resources. |
| `kubectl describe service <name>` | View service details (Endpoints, IPs). |

---

## 💾 Configuration & Storage
*Manage ConfigMaps, Secrets, and Volumes.*

| Command | Description |
| :--- | :--- |
| `kubectl get configmaps` | List all ConfigMaps. |
| `kubectl get secrets` | List all Secrets (names only, not content). |
| `kubectl create secret generic <name> --from-literal=key=val` | Create a secret from a literal value. |
| `kubectl get pv` | List Persistent Volumes. |
| `kubectl get pvc` | List Persistent Volume Claims. |

---

## 🔍 Troubleshooting & Logs
*Debug issues and analyze resource state.*

| Command | Description |
| :--- | :--- |
| `kubectl logs <pod_name>` | Print logs for a specific pod. |
| `kubectl logs -f <pod_name>` | Stream logs in real-time (follow). |
| `kubectl logs <pod> -c <container>` | Get logs for a specific container in a multi-container pod. |
| `kubectl top pod` | Show CPU and Memory usage for pods (requires Metrics Server). |
| `kubectl top node` | Show CPU and Memory usage for nodes. |
| `kubectl get events --sort-by='.metadata.creationTimestamp'` | List recent cluster events sorted by time. |

---

### 💡 Pro Tips

**1. Set an Alias**
Save time by adding this to your `.bashrc` or `.zshrc`:
```bash
alias k="kubectl"
# Usage: k get pods