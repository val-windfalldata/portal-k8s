# STEP 1: docker build command (to build Linux container on MacOS)
1. docker buildx build --platform=linux/amd64 -t gcr.io/tranquil-garage-139216/portal-login-qa:latest .
2. docker push gcr.io/tranquil-garage-139216/portal-login-qa:latest

# STEP 2: deploy to QA
1. kubectx gke_wf-portal-qa_us-central1_wf-qa-private
2. kubectl apply -f kubernetes/portal-login-deployment.yaml

all resources get deployed to the portal namespace.

# STEP 3: see what is broken this time around
1. view pods in portal namespace:
   kubectl get pods -n portal

2. view the log of portal-login
   kubectl logs <portal-login-pod-name>
