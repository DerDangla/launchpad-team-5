terraform {
  required_version = ">= 1.0.0"

  cloud {
    # The name of your Terraform Cloud organization.
    organization = "emander-org"

    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      name = "launchpad-team-5"
    }
  }
}
