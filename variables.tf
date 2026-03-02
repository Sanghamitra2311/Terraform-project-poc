variable "project_id" {
  description = "The GCP Project ID"
  type        = string
  default     = "ornate-node-483516-e3"
}

variable "region" {
  description = "The default compute region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The default compute zone"
  type        = string
  default     = "us-central1-a"
}

variable "instance_count" {
  description = "Number of VMs to create"
  type        = number
  default     = 5
}

variable "machine_type" {
  description = "The size of the VMs"
  type        = string
  default     = "e2-micro" # Switched to micro to save your billing account!
}
