variable public_key_path {
  description = "Path to the public key used to connect to instance"
}

variable private_key_path {
  description = "Path to ssh private key file for provisioners authentication"
  default = "~/.ssh/id_rsa"
}

variable zone {
  description = "Zone"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-db-base"
}

variable network_name {
  description = "Network name"
  default     = "default"
}

variable environment {
  description = "Environment name"
}
