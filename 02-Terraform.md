## Terraform Lifecycle Flow Chart

```mermaid
flowchart TD
    A(Write Configuration) --> B(Initialize: terraform init)
    B --> C(Plan: terraform plan)
    C --> D(Apply: terraform apply)
    D --> E(Provision Resources)
    E --> F(Change Infrastructure)
    F --> G(Destroy: terraform destroy)
    G --> H(Clean Up Resources)
```
