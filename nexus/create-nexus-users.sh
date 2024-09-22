#!/bin/bash

# Wait until Nexus is fully up and running
until curl -s -o /dev/null -w "%{http_code}" http://localhost:8081/service/rest/v1/status | grep 200; do
  echo "Waiting for Nexus to start..."
  sleep 10
done

# Define your new user data
curl -u admin:admin123 -X POST 'http://localhost:8081/service/rest/v1/security/users' \
-H 'Content-Type: application/json' \
-d '{
  "userId": "newuser",
  "firstName": "New",
  "lastName": "User",
  "emailAddress": "newuser@example.com",
  "password": "newuserpassword",
  "status": "active",
  "roles": ["nx-admin"]
}'

echo "User created successfully!"
