# Infrastructure repo for [gpuslave/harmony-go](https://github.com/gpuslave/harmony-go)

### Infra stack

- **terraform** `>=1.11.1`
  - **yandex-cloud/yandex** `>=0.136.0`
- **terragrunt** `>=0.75.3`
- **helm** *~TBD~*
- **fluxcd** *~TBD~*

### Directory structure (as-is)

```
.
├── charts
└── terraform
    ├── environments
    │   ├── dev
    │   │   └── k8s_network
    │   └── prod
    ├── modules
    │   ├── bastion
    │   ├── bastion_network
    │   ├── k8s
    │   └── k8s_network
    └── templates
```