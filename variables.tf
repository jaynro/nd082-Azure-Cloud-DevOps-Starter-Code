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


