# Terraform GCP Infrastructure Project

This project provisions Google Cloud Platform (GCP) resources using Terraform. It demonstrates how to create multiple preemptible (spot) virtual machines (VMs) in a specified region and zone, with customizable parameters.

## Features

- Uses the [Google Cloud Provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs) for Terraform
- Provisions multiple spot VMs with auto-deletion after a set duration
- Outputs VM names and public IPs
- All configuration is customizable via variables

---

## Files

- **main.tf**: Main Terraform configuration for provider and resources
- **variables.tf**: Input variables for customization
- **output.tf**: Output values for VM names and public IPs

---

## Requirements

- [Terraform](https://www.terraform.io/downloads.html) 1.14.6 or later
- [Google Cloud SDK (gcloud)](https://cloud.google.com/sdk/docs/install) (for authentication)
- A GCP project with billing enabled

---

## Usage

1. **Clone the repository:**

   ```sh
   git clone https://github.com/Sanghamitra2311/Terraform-project-poc.git
   cd Terraform-project-poc/GCP-Infra
   ```

2. **Authenticate with Google Cloud:**

   ```sh
   gcloud auth application-default login
   ```

3. **Initialize Terraform:**

   ```sh
   terraform init
   ```

4. **Review and customize variables (optional):**
   Edit `variables.tf` or use `-var` flags to override defaults.

5. **Plan the deployment:**

   ```sh
   terraform plan
   ```

6. **Apply the configuration:**
   ```sh
   terraform apply
   ```

---

## Variables

| Name           | Description             | Type   | Default               |
| -------------- | ----------------------- | ------ | --------------------- |
| project_id     | The GCP Project ID      | string | ornate-node-483516-e3 |
| region         | The compute region      | string | us-central1           |
| zone           | The compute zone        | string | us-central1-a         |
| instance_count | Number of VMs to create | number | 5                     |
| machine_type   | The size of the VMs     | string | e2-micro              |

---

## Outputs

- **vm_names**: The names of the created VMs
- **vm_public_ips**: The public IP addresses of the created VMs

---

## Notes

- The VMs are preemptible (spot) and will be automatically deleted after 10 minutes (600 seconds).
- You can change the region, zone, machine type, and number of VMs by editing `variables.tf` or passing variables at apply time.
- State files (`terraform.tfstate`, `.terraform/`) are included by default. For production, consider adding a `.gitignore` to exclude sensitive files.

---

## License

See [LICENSE.txt](../LICENSE.txt) for license information.
