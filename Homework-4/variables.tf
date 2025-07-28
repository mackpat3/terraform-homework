variable region {
    description = "Choose AWS region"
    default = ""
    type = string
}

variable key_name{
    description = "Provide key name"
    default = ""
    type = string
}

variable port {
  type = list(number)
  description = "Provide port"
}

variable vpc {
    type = object({
    cidr = string
    dns_support = bool
    dns_hostnames = bool
  })
  default = {
    cidr = ""
    dns_support = false
    dns_hostnames = false
  }
}

variable subnet {
  type = list(object({
    cidr = string
    az = string
    get_public_ip = bool 
    name = string}))

  default = [
    {
    cidr = ""
    az = ""
    get_public_ip = true
    name = ""
  },
    {
    cidr = ""
    az = ""
    get_public_ip = true
    name = ""
  },
    {
    cidr = ""
    az = ""
    get_public_ip = false
    name = ""
  },
  {
    cidr = ""
    az = ""
    get_public_ip = false
    name = ""
  }
  ]
}

variable igw_name{
    description = "Provide IGW name"
    default = ""
    type = string
}

variable route_table {
   description = "Input names for route tables"
   type        = list(string)
   default     = null
   nullable    = true
}


variable ec2_web {
  type = map(string)
  default = {
      ami_id_1 = ""
      instance_type1 = ""
      ami_id_2 = ""
      instance_type2 = ""
  }
}