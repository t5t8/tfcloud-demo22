# tfcloud-demo22
Terraform cloud demo 2022 
This repository is intended to demonstrate basic usage and automation of Terraform Cloud. Features covered:
- Organization creation with members
- Version Control System (VCS) integration to Github with personal access token (PAT)
- Creation of workspaces and variables
- Azure resources workspace
- Workspace shared state outputs

## Pre-requisites

To use this fully you need accounts.

Terraform Cloud:
https://app.terraform.io/signup/account

Github:
https://github.com/signup

Credentials for an Azure subscription. For example service principal identity.

### Create github token
Create a personal access token
https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token

### Clone the repository to your Github account

Clone this repository to your Github account and local command line. You will need repository name in variables.

### Get Azure credentials

To use Azure workspace you need credentials for identity that has collaborator access to subscription. You will need subscription, tenant and client ids, as well as a client secret.

### Login to Terraform Cloud

From CLI use `terraform login` to authenticate to Terraform Cloud.

## Setup variables for tfe settings

Create a file `/terraform/tfe-settings/variables.auto.tfvars`, fill in the variables described in `/terraform/tfe-settings/variables.tf`

Define:
- Name for organization, this needs to be unique
- Contact email for organization.
- Location for the code in Github. 
- PAT for Terraform cloud to access Github
- List of users for Terraform Cloud

You can define more users to organization or leave the list blank:
`tfe_organization_members = []`


## Create Terraform Cloud Organization and workspaces

Initialize and apply tfe-settings from CLI.
You should now be able to see your organization and workspaces from the portal.

NOTE! The default billing plan is Free plan that does not support teams. 1st run will
fail to error about missing entitlements to create team. You need to login to portal and
upgrade to team plan or free trial for team features to be enabled.

### Update Azure env variables

Go to `azure_demo` workspace and select variables. Fill in the Azure credentials using environment variables `ARM_*` 

