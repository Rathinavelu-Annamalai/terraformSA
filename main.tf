provider "azurerm" {
  	features {}
}

#create resource group
resource "azurerm_resource_group" "rg" {
    name     = "rg-MyFirstTerraform"
    location = "westus"
}

#Create Storage Account
module "storage_account" {
  source    = "./modules/storage-account"

  saname    = "statfdemosa234"
  rgname    = azurerm_resource_group.rg.name
  location  = azurerm_resource_group.rg.location
}
