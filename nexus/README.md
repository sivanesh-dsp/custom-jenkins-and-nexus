<h1>Build Custom Container Image</h1>
This Custom Nexus image has pre-configured users (without initial password). To Build this image run these following command

1. change directory to dockerfile
```
cd custom-jenkins-and-nexus/nexus
```
2. Build the Container image using docker
```
docker build -t <image_name> .
```
3. Check the Image running properly with neccessary plugins preinstalled
```
docker run -dp 8080:800 <image_name>
```
<h2> nexus automated user setup </h2>

![image](https://github.com/user-attachments/assets/1c07005a-98a7-49bf-b673-38d6a00f168b)


admin default credentials: 

` username - admin `

` Password - admin123 `

new user credentials:

` username - newuser`

`Password - newuserpassword`

(can be modified in create-nexus-users.sh)


