This repo contains the starter materials for projects from the Udacity Azure Cloud DevOps Nanodegree Program.



Pre-Requisites
  An Azure Account
  An installation if the latest version of Terraform
  An installation if the latest version of Packer
  An installation if the latest version of Azure CLI

Getting Started

1.-Make sure the server.json file is working by running: packer build demo.json.
2.-Very that the image exist by running: az image list
3.-Verify that Terrraform setup is ready  by executing:  terraform plan
4.-Deploy the infraestructure with: terraform apply
5.-Login into you azure account and validate the infraestructure is deployed

Customize input variables
1.-Edit vars.tf file
2.-Add or edit an input, with its corresponding description.
3.-Save the file.
4.-Verify your changes are displying when you execute the terraform plan command





