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




# Container apps  service
variable "containerapp" {
  description = "Container App Name"
  default     = ""
}
variable "targetport" {
  description = "targetport for containerapps"
  default = ""
}
variable "exposedport" {
  description = "exposeport for containerapps"
  default = ""
}


# Container apps  service
variable "containerapp" {
  description = "Container App Name"
  default     = ""
}
variable "targetport" {
  description = "targetport for containerapps"
  default = ""
}
variable "exposedport" {
  description = "exposeport for containerapps"
  default = ""
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


