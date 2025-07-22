variable region {
  default = "us-west-2"
  type = string
  description = "Provide Region"
}

variable key_name {
  default = "hmwk4-key"
  type = string
  description = "Provide key name"
}

variable port {
  default = [22, 80, 443, 3306]
  type = list (number)
  description = "Provide port"
}