# terraform-laravel
terraform + kubernetes for laravel, nginx, mysql

## How to Use
1. Setup kubernetes cluster  
You can use minikube, k3s, k3d, or anything that you want.
```
k3d cluster create percobaandua --api-port 10.199.16.55:8443 -p 8000:30080@agent[0] -p 8043:30443@agent[0] --agents 1
```
2. Intall terraform  
Check [this link](https://learn.hashicorp.com/terraform/getting-started/install.html) to learn how to install terraform.
3. Clone this repository and go inside the clonned folder  
  ```bash
  git clone https://github.com/LERUfic/terraform-laravel
  ```
4. Initialize the project  
  ```bash
  terraform init
  ```
5. Check your deployment using terraform plan before you actually create your infrastructure  
  ```bash
  terraform plan
  ```
6. If you are sure the plan result is correct, you can apply the deployment  
  ```bash
  terraform apply
  #A promt will appear, all you need is just type yes and enter
  ```
