# Locals in Terraform

## What are Locals?

Locals in Terraform are named values that you can use to simplify and organize your configuration. They are useful for storing intermediate values, reducing repetition, and making your code more readable.

## Why Use Locals?

- **Simplify complex expressions:** Store the result of a calculation or expression in a local value.
- **Reduce repetition:** Use a local value in multiple places instead of repeating the same logic.
- **Improve readability:** Give meaningful names to values used in your configuration.

## Example Use Cases

- Combining multiple variables into a single value.
- Creating tags or labels used across resources.
- Storing computed values for use in resource arguments.

## Example Code

````hcl
// filepath: /workspaces/terraformtraining/code/locals/main.tf
locals {
  instance_name = "web-server-${var.env}"
  common_tags = {
    Environment = var.env
    Owner       = "admin"
    Project     = "TerraformDemo"
  }
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  tags          = local.common_tags
}