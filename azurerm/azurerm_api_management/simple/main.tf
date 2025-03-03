# Summary: A simple Azure Load Balancer

# Documentation: https://www.terraform.io/docs/language/settings/index.html
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.0"
    }
  }
}

# Documentation: https://www.terraform.io/docs/language/values/variables.html
variable "azure_subscription_id" {
  type = string
}

# Documentation: https://www.terraform.io/docs/language/providers/requirements.html
# Documentation: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
provider "azurerm" {
  features {}

  subscription_id = var.azure_subscription_id
}

# Resource Group
# Documentation: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group
resource "azurerm_resource_group" "changeme_simple_api_management_resource_group" {
  name     = "changeme-simple-api-management-resource-group-name"
  location = "West Europe"
}

# API Management Service
# Documentation: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management
resource "azurerm_api_management" "changeme_simple_api_management" {
  name                = "changeme-simple-api-management-name"
  location            = "West Europe"
  resource_group_name = azurerm_resource_group.changeme_simple_api_management_resource_group.name

  publisher_name  = "changeme-publisher"
  publisher_email = "changeme-publisher@example.com"

  sku_name = "Developer_1"
}
