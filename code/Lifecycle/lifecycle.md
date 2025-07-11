### Terraform Lifecycle Options

- **create_before_destroy:**  
  Ensures a new resource is created before the old one is destroyed, useful for resources where downtime is not acceptable.

- **prevent_destroy:**  
  Protects resources from accidental deletion by requiring a manual override to destroy.

- **ignore_changes:**  
  Tells Terraform to ignore changes to specified arguments, preventing unnecessary updates.

- **replace_triggered_by:**  
  Forces resource replacement if any of the listed attributes or resources change.

---

### depends_on

- **Explicit Dependency:**  
  Use `depends_on` to tell Terraform that one resource must be created before another.  
  Example: `aws_s3_bucket_object.file` depends on `aws_s3_bucket.this`.

- **Implicit Dependency:**  
  Terraform automatically understands dependencies when you reference one resource in another (e.g., using `bucket = aws_s3_bucket.this.id`).

---

**Implicit vs Explicit Dependencies:**

- **Implicit:**  
  Managed automatically by Terraform through resource references.

- **Explicit:**  
  Manually specified using `depends_on` when Terraform cannot infer the relationship.

Use explicit dependencies when resource relationships are not clear from the configuration or when you need to enforce a specific order of operations.