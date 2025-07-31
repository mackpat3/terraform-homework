variable region {
  type = string
  description = "Provide region"
}

variable key_name {
  type = string 
  description = "Provide key name"
}

variable port {
  type = list(number)
  description = "Provide port"
}

variable ec2_web {
  type = map(string)
}

variable vpc {
    type = object({
    cidr = string
    dns_support = bool
    dns_hostnames = bool
  })
  default = {
    cidr = ""
    dns_support = true
    dns_hostnames = true
  }
}

variable subnet {
  type = list(object({
    cidr = string
    az = string
    map_public_ip_on_launch = bool 
    name = string}))

  default = [
    {
    cidr = ""
    az = ""
    map_public_ip_on_launch = true
    name = ""
  },
    {
    cidr = ""
    az = ""
    map_public_ip_on_launch = true
    name = ""
  },
    {
    cidr = ""
    az = ""
    map_public_ip_on_launch = false
    name = ""
  },
    {
    cidr = ""
    az = ""
    map_public_ip_on_launch = false
    name = ""
  }
  ]
}

variable igw {
    type = string
    default = ""
}

variable route_table {
  type = list(string)
  default = []
}