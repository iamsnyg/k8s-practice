# Commands
kubectl apply -f namespace.yml
kubectl apply -f deployment.yml
kubectl apply -f service.yml
kubectl apply -f ingress.yml
kubectl get all -n notes-app
kubectl get namespace notes-app

# Volumes and Persistent Storage Commands and Notes
kubectl apply -f persistent-volume.yml
kubectl apply -f persistent-volume-claim.yml
kubectl get pv
kubectl get pvc -n notes-app
kubectl describe pvc <pvc-name> -n notes-app
kubectl delete pvc <pvc-name> -n notes-app
kubectl delete pv <pv-name>
kubectl edit pvc <pvc-name> -n notes-app
kubectl edit deployment notes-app-deployment -n notes-app
# Notes
- Make sure to create a Namespace for the notes-app to isolate its resources.
- Use Persistent Volumes and Persistent Volume Claims to manage data storage for the notes-app.
- Update the Deployment to mount the Persistent Volume to the appropriate path in the container.
- Expose the notes-app using a Service of type ClusterIP.
- Optionally, set up an Ingress resource to manage external access to the notes-app.
- Always verify the status of Pods, Services, and PVCs after applying configurations.
- Use `kubectl describe` to troubleshoot issues with PVCs and Pods.
