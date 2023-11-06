# resource group name
variable "resource" {
  description = "Resource Group Name"
  default     = "demotestCA"
}
# region name
variable "location" {
  description = "Region Name"
  default     = "eastus"
}

variable "subscription_id" {
  default = ""
}
variable "tenant_id" {
  default = ""
}
variable "client_id" {
  default = ""
}
variable "client_secret" {
  default = ""
}

# Container Registry
variable "cr" {
  description = "Container Registry"
  default     = "demotest"
}

variable "log" {
  description = "Log Analytics Workspace"
  default     = "demotestLOG"
}

# Container Apps Enviroment
variable "env" {
  description = "Container app env"
  default     = "demotestENV"
}


# Application  apps
variable "mysql_list" {
  description = "acceptable values"
  type        = map
  default     = {
    value1 = "admin"
    value2 = "password"
    port = 3306
  }
}


# Container apps springapps service
variable "springappscontainerapp" {
  description = "Container App Name"
  default     = "springapps"
}
variable "springappstargetport" {
  description = "targetport for containerapps"
  default = "8080"
}
variable "springappsexposedport" {
  description = "exposeport for containerapps"
  default = "8080"
}


# Container apps mysql service
variable "mysqlcontainerapp" {
  description = "Container App Name"
  default     = "mysql"
}
variable "mysqltargetport" {
  description = "targetport for containerapps"
  default = "3306"
}
variable "mysqlexposedport" {
  description = "exposeport for containerapps"
  default = "3306"
}




# application expose public IP
variable "publicip" {
  description = "Public Ip"
  default = "demotestPublicIP"
}

# Application gateway apps
variable "applicationgateway" {
  description = "Application Gateway Name"
  default = "demotestAGW"
}

#container registry reg
variable "registry" {
  default = "<REGISTRY>"
}
#container registry name
variable "registry_name"{
  default = "<REGISTRY_NAME>"
}
#conatiner registry password
variable "registry_password" {
  default = "<REGISTRY_PASSWORD>"
}


