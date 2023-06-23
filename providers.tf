terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }

    azurerm = {
      source = "hashicorp/azurerm"
      # Root module should specify the maximum provider version
      # The ~> operator is a convenient shorthand for allowing only patch releases within a specific minor release.
      version = "~> 3.0"
    }

  }
}

# Configure the AWS Provider
provider "aws" {
  region  = "eu-west-2"
  }

provider "azurerm" {
  features {}
}


