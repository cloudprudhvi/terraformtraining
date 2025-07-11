# Outputs in Terraform

## What are Outputs?

Outputs in Terraform are used to display information after your infrastructure is created or updated. They help you access resource attributes, share data between modules, and provide useful details like IP addresses, resource IDs, or connection strings.

## Why Use Outputs?

- **Visibility:** See important resource information after deployment.
- **Sharing:** Pass values between modules or to other tools/scripts.
- **Automation:** Use output values in CI/CD pipelines or other automation.

## Example Usage

```hcl
output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.example.id
}

output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.example.public_ip
}
```

## Example Output

After running `terraform apply`, you will see:

```
Outputs:

instance_id = "i-0abcd1234efgh5678"
instance_public_ip = "54.123.45.67"
```

## Summary

Outputs make it easy to retrieve and use important information from your Terraform-managed resources. They are essential for automation, integration, and visibility.