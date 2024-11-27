terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket  = "hackaton-team5-tf-state"
    key     = "terraform.tfstate"
    region  = "ca-central-1"
    encrypt = true
  }
}
