#!/usr/bin/env bash
openssl rand -base64 741 > ./keys/key.txt
kubectl create secret generic shared-bootstrap-data --from-file=internal-auth-mongodb-keyfile=./keys/key.txt

kubectl apply -f deploy.yml

kubectl exec -it mongod-0 -c mongod-container bash

 mongo --eval "rs.initiate({_id: "MainRepSet", version: 1, members: [
       { _id: 0, host : "mongod-0.mongodb-service.default.svc.cluster.local:27017" },
       { _id: 1, host : "mongod-1.mongodb-service.default.svc.cluster.local:27017" },
       { _id: 2, host : "mongod-2.mongodb-service.default.svc.cluster.local:27017" }
 ]});"
 echo "Replication done..."


