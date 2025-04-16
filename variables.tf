variable "key_name" {
  description = "Nombre de la key pair existente"
  type        = string
}

variable "ami_id" {
  description = "AMI Ubuntu 22.04"
  type        = string
  default     = "ami-080e1f13689e07408" # Ubuntu 22.04 LTS us-east-1
}