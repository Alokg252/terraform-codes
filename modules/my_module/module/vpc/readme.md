# Module: VPC

This is a simple Terraform module for creating a VPC on AWS.

## Files

### `main.tf`

This file defines the main VPC resource and any dependent resources.

### `outputs.tf`

This file defines the module's output variables.

### `variables.tf`

This file defines the module's input variables.

## How it works

1. The module is configured by passing in values for the input variables in the `variables.tf` file.
2. The `main.tf` file uses these input variables to create a VPC resource and any dependent resources.
3. The `outputs.tf` file exports the created VPC's attributes as output variables.
4. The `variables.tf` file defines variable to take input from user
5. The `config.tf` file is used for module accessing and using variables to create resources
## Example usage
