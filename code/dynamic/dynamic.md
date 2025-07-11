# Dynamic Blocks in Terraform

Dynamic blocks allow you to generate repeated nested configuration blocks based on variable input. This is useful for resources like security groups (with multiple rules) or EC2 instances (with multiple tags).

## Why Use Dynamic Blocks?

- **Reduce repetition:** Avoid writing similar blocks multiple times.
- **Increase flexibility:** Easily adjust the number of blocks using variables or lists.
- **Maintainability:** Changes can be made in one place (the variable) instead of many.

## Use Cases

### 1. Security Group with Dynamic Ingress Rules

You can define a list of ingress rules as a variable and use a dynamic block to create each rule inside the security group resource.

### 2. EC2 Instance with Dynamic Tags

You can define a map of tags and use it to assign multiple tags to your EC2 instance.

## Summary

Dynamic blocks help keep your Terraform code DRY (Don't Repeat Yourself) and flexible, especially when dealing with resources that require multiple similar nested blocks.