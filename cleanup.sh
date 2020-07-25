#!/bin/bash

#terraforom destroy
k3d cluster delete percobaandua
k3d cluster create percobaandua --api-port 10.199.16.55:8443 -p 8000:30080@agent[0] -p 8043:30443@agent[0] --agents 1
cp ~/.kube/config .
rm terraform.tfstate terraform.tfstate.backup
git add -A
git commit -m "chore(cluster): reset project cluster"
git push