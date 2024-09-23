<h1> Push custom container image to ACR</h1>

1. Create a Container Registry in Azure
2. Copy the Login Server from azure portal

   container registry -> Settings -> Access Keys
3. docker login \<login_server>
4. docker tag \<image name> \<login_server>/<image_name>:tag
5. docker push \<login_server>/<image_name>:tag