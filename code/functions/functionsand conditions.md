# Conditions and Functions in Terraform

## Conditions in Terraform

Terraform supports conditional logic using the ternary operator (`condition ? true_value : false_value`). This allows you to set values based on certain conditions.

**Example:**
```hcl
variable "env" {
  default = "dev"
}

resource "aws_instance" "example" {
  instance_type = var.env == "prod" ? "t3.large" : "t2.micro"
}
```
In this example, if `env` is "prod", the instance type will be "t3.large"; otherwise, it will be "t2.micro".

---

## Functions in Terraform

Terraform provides many built-in functions to manipulate strings, numbers, lists, maps, and more.

### Common Functions

- **length(list):** Returns the number of elements in a list.
  ```hcl
  length(["a", "b", "c"]) # 3
  ```

- **upper(string):** Converts a string to uppercase.
  ```hcl
  upper("hello") # "HELLO"
  ```

- **lower(string):** Converts a string to lowercase.
  ```hcl
  lower("WORLD") # "world"
  ```

- **join(separator, list):** Joins list elements into a string.
  ```hcl
  join(",", ["a", "b", "c"]) # "a,b,c"
  ```

- **lookup(map, key, default):** Gets a value from a map, or returns a default if the key is missing.
  ```hcl
  variable "instance_types" {
    default = {
      dev  = "t2.micro"
      prod = "t3.large"
    }
  }

  resource "aws_instance" "example" {
    instance_type = lookup(var.instance_types, var.env, "t2.micro")
  }
  ```
  In this example, the `lookup` function checks the `instance_types` map for the current environment. If the environment is not found, it defaults to `"t2.micro"`.

- **contains(list, value):** Checks if a list contains a value.
  ```hcl
  contains(["a", "b", "c"], "b") # true
  ```

---

## Summary

- Use conditions to make your Terraform code flexible and environment-aware.
- Use functions to manipulate and transform data for your resources.