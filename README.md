# Overview
This repo contains the starter materials for projects from the Udacity Azure Cloud DevOps Nanodegree Program.
This code intends to create infrastructure as code in the form of a Terraform template to deploy a scalable cluster of servers with a load balancer to manage the incoming traffic. We will use Packer to create a server image, and adheance to security practices.


# Pre-Requisites
  An Azure Account.
  An installation if the latest version of Terraform.
  An installation if the latest version of Packer.
  An installation if the latest version of Azure CLI.

# Getting Started

1. Make sure the server.json file is working by running: packer build demo.json.
  - The command output will shows a "Hello World!" message from the previosioner and information about the image:
  ```
Build 'azure-arm' finished after 10 minutes 56 seconds.

==> Wait completed after 10 minutes 56 seconds

==> Builds finished. The artifacts of successful builds are:
--> azure-arm: Azure.ResourceManagement.VMImage:

OSType: Linux
ManagedImageResourceGroupName: udacity-images
ManagedImageName: myPackerImage
ManagedImageId: /subscriptions/09d9f2d9-084c-455a-a64f-9c03e7820800/resourceGroups/udacity-images/providers/Microsoft.Compute/images/myPackerImage
ManagedImageLocation: East US

```

   
2. Very that the image exist by running: az image list
3. Verify that Terrraform setup is ready  by executing:  terraform plan -out solution.plan
```

Plan: 13 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

This plan was saved to: solution.plan

To perform exactly these actions, run the following command to apply:
    terraform apply "solution.plan"
```
4. Deploy the infraestructure with: terraform apply
5. Login into you azure account and validate the infraestructure is deployed

# Customize input variables
Variables can be used to configure attributes for the resources. For example, location and prefix are used accross several resources to define a resource name prefix and setup the location. The capacity variable is used to define the number of VM  you want to create.

Variables can be used in another resourced, to create or edit existing variables, you can follow the next steps:

1. Open vars.tf file
```
variable "prefix" {
        default = "udacity"
        description = "The prefix which should be used for all resources in this example"
}

variable "location" {
        default="eastus"
        description = "The Azure Region in which all resources in this example should be created."
}

variable "capacity" {
        default=2
        description = "Enter the number of VMs"

        validation{
                condition =var.capacity >1 && var.capacity <6
                error_message="The default value for the count parameter should be at least 2, and for cost reasons, no more than 5."
        }
}

```
2. Add or edit an input, with its corresponding description, default value or validation.
3. Save the file.
4. You can reference these variables in main.tf by using the following syntaxis:
```
resource "azurerm_resource_group" "test" {
  name     = "${var.prefix}-resources"
  location = var.location
}
``` 
5. Verify your changes are displying when you execute the terraform plan command.






