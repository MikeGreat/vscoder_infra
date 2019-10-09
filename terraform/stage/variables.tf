variable project {
  description = "Project ID"
}
variable region {
  description = "Region"
  default     = "europe-west1"
}
variable zone {
  description = "Zone"
  default     = "europe-west1-d"
}
variable public_key_path {
  description = "Path to the public key used for ssh access"
}
variable private_key_path {
  description = "Path to ssh private key file for provisioners authentication"
  default = "~/.ssh/id_rsa"
}
variable disk_image {
  description = "Disk image"
}
variable ssh_keys {
  type = list(string)
}
variable instance_count {
  type    = number
  default = 1
}
variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}
variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-db-base"
}
variable environment {
  description = "Environment name"
  default     = "stage"
}
variable use_static_ip {
  description = "Need to create static ip for instance?"
  default     = false
}
