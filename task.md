Task 2: Write Optimal Dockerfiles for Jenkins and Nexus Custom Installation 
Objective: Create Dockerfiles for Jenkins and Nexus custom installations following Docker best practices, build the images, and push them to Azure Container Registry. (ACR).
Steps:
1. Write a Dockerfile for Jenkins using a lightweight base image (e.g., alpine), install necessary dependencies, and set up Jenkins with required plugins and configurations.
2. Write a Dockerfile for Nexus using a lightweight base image and configure Nexus with the necessary settings.
3. Build the Docker images using docker build -t \<image name\> .
4. Push the images to ACR using docker push <acr_repo>/<image_name>.
