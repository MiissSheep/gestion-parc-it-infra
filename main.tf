terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.0"
    }
  }
  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
}


resource "random_integer" "ri" {
  min = 1000
  max = 9999
}


resource "azurerm_resource_group" "rg" {
  name     = "rg-MissSheep-${random_integer.ri.result}"
  location = "francecentral"
}


resource "azurerm_service_plan" "asp" {
  name                = "asp-MissSheep-${random_integer.ri.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "B1"
}


resource "azurerm_linux_web_app" "webapp" {
  name                = "webapp-MissSheep-${random_integer.ri.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    
  }
  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false" 
    
  }
}