terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "2.5.1"
    }
    # aws = {
    #   source = "hashicorp/aws"
    #   version = "5.65.0"
    # }
  }
}

// Local provider does not require any configuration
provider "local" {}

# provider "aws" {
#   region = "us-east-1"
# }