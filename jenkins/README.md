<h1>Build Custom Container Image</h1>
This Custom Jenkins image has pre-installed plugins and automated setup of users (without initial password). To Build this image run these following command

1. change directory to dockerfile
```
cd custom-jenkins-and-nexus/jenkins
```
2. Build the Container image using docker
```
docker build -t <image_name> .
```
3. Check the Image running properly with neccessary plugins preinstalled
```
docker run -dp 8080:800 <image_name>
```
<h2> jenkins automated user setup </h2>

![image](https://github.com/user-attachments/assets/7389bede-9fe6-49a5-99c2-76deacadfc08)

default credentials: 

username - admin 

Password - admin

(can be modified in jenkins.yaml)

<h2> preinstalled jenkins plugins </h2>

![image](https://github.com/user-attachments/assets/9a04d42a-f09a-4fcb-8560-30a52d5d50e6)

(plugins can be added and modifed in plugins.txt)

