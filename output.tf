output "vm_names" {
  description = "The names of the created VMs"
  value       = google_compute_instance.my_vms[*].name
}

output "vm_public_ips" {
  description = "The public IP addresses of the newly created VMs"
  # This drills down into the resource attributes to find the assigned public IP
  value = google_compute_instance.my_vms[*].network_interface[0].access_config[0].nat_ip
}
