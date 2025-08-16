# Terraform AWS KMS Module

This Terraform module provisions a flexible, customer-managed AWS Key Management Service (KMS) key and an associated alias.

It is designed with security best practices in mind, such as enabling key rotation by default. The module allows for the use of a custom key policy or, if one is not provided, defaults to a policy that grants full administrative access to the AWS account's root user.

## Usage Examples

### Basic Usage

```hcl
module "application_kms_key" {
  source = "./terraform-aws-kms" # Or a path to the module from the registry

  alias_name      = "my-app-key"
  key_description = "KMS key for My App"
  
  tags = {
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}
```

## Requirements

| Name      | Version |
| --------- | ------- |
| Terraform | `~> 1.0`  |
| AWS       | `~> 5.0`  |

## Inputs

| Name                      | Description                                                                          | Type     | Default                          | Required |
| ------------------------- | ------------------------------------------------------------------------------------ | -------- | -------------------------------- | :------: |
| `alias_name`              | The name for the KMS key alias (without the 'alias/' prefix).                        | `string` | `n/a`                            |   yes    |
| `key_description`         | A description for the KMS key.                                                       | `string` | `"KMS key managed by Terraform"` |    no    |
| `key_policy_json`         | The key policy as a JSON string. If null, a default policy granting root access is used. | `string` | `null`                           |    no    |
| `enable_key_rotation`     | Specifies whether key rotation is enabled for this key.                              | `bool`   | `true`                           |    no    |
| `deletion_window_in_days` | The waiting period, in days, before deleting the key. Can be between 7 and 30.       | `number` | `10`                             |    no    |

## Outputs

| Name         | Description                                                  |
| ------------ | ------------------------------------------------------------ |
| `key_arn`    | The Amazon Resource Name (ARN) of the KMS key.               |
| `key_id`     | The globally unique identifier for the KMS key.              |
| `alias_name` | The name of the KMS key alias (e.g., 'alias/my-key').        |
| `alias_arn`  | The Amazon Resource Name (ARN) of the KMS key alias.         |