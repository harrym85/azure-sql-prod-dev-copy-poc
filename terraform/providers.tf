provider "azurerm" {
  alias           = "prod"
  subscription_id = var.prod_subscription_id

  features {}
}

provider "azurerm" {
  alias           = "dev"
  subscription_id = var.dev_subscription_id

  features {}
}