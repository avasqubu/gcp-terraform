
variable "region" {
  description = "La región donde se creará la instancia."
  type        = string
  default     = "us-central1-a"
}

variable "machine_type" {
  description = "El tipo de máquina para la máquina virtual."
  type        = string
  default     = "n1-standard-1"
}

variable "image" {
  description = "La imagen que se utilizará para el disco de arranque (SO)."
  type        = string
  default     = "debian-cloud/debian-11"
}

variable "instance_name" {
  description = "El nombre de la instancia de Maquina Virtual."
  type        = string
  default     = "maquina-virtual"
}