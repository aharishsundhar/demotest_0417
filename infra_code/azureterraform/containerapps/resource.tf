provider "azurerm" {
  features {}

  subscription_id   = var.subscription_id
  tenant_id         = var.tenant_id
  client_id         = var.client_id
  client_secret     = var.client_secret
}
resource "azurerm_resource_group" "example" {
  name     = var.resource
  location = var.location
}
resource "azurerm_log_analytics_workspace" "example" {
  name                = var.log
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}
resource "azurerm_container_app_environment" "example" {
  name                       = var.env
  location                   = azurerm_resource_group.example.location
  resource_group_name        = azurerm_resource_group.example.name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.example.id
  infrastructure_subnet_id   = azurerm_subnet.example.id
}




# Container apps add all files
resource "azurerm_container_app" "springapps" {
  name                         = var.springappscontainerapp
  container_app_environment_id = azurerm_container_app_environment.example.id
  resource_group_name          = azurerm_resource_group.example.name
  revision_mode                = "Single"
  registry {                
    server               = "demotest.azurecr.io"
    username             = "demotest"
    password_secret_name = "mypassword"
  }
  secret {
    name  = "mypassword"
    value = var.registry_password
  }

  template {
    container {
      name   = "springapps"
      image  = "demotest.azurecr.io/springapps:latest"
      cpu    = 0.25
      memory = "0.5Gi"
    }
    revision_suffix = "v1"
    max_replicas = "1"
    min_replicas = "1"
  }
  
  tags = {
    project_name = "demotest_0417"
  }
  
  ingress {
    external_enabled = true
    transport        = "http"
    target_port      = 8080
    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }
  provisioner "local-exec" {
    command = "az containerapp ingress update --name $CONTAINER_NAME --resource-group $RG --target-port $TP --exposed-port $EP --transport TCP --type external"
     environment = {
      CONTAINER_NAME = var.springappscontainerapp
      RG = var.resource
      TP = var.springappstargetport
      EP = var.springappsexposedport
    }
  }

}
resource "azurerm_container_app" "mysql" {
  name                         = var.mysqlcontainerapp
  container_app_environment_id = azurerm_container_app_environment.example.id
  resource_group_name          = azurerm_resource_group.example.name
  revision_mode                = "Single"
  registry {                
    server               = "demotest.azurecr.io"
    username             = "demotest"
    password_secret_name = "mypassword"
  }
  secret {
    name  = "mypassword"
    value = var.registry_password
  }

  template {
    container {
      name   = "mysql"
      image  = "demotest.azurecr.io/mysql:latest"
      cpu    = 0.25
      memory = "0.5Gi"
    }
    revision_suffix = "v1"
    max_replicas = "1"
    min_replicas = "1"
  }
  
  tags = {
    project_name = "demotest_0417"
  }
  
  ingress {
    external_enabled = true
    transport        = "http"
    target_port      = 3306
    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }
  provisioner "local-exec" {
    command = "az containerapp ingress update --name $CONTAINER_NAME --resource-group $RG --target-port $TP --exposed-port $EP --transport TCP --type external"
     environment = {
      CONTAINER_NAME = var.mysqlcontainerapp
      RG = var.resource
      TP = var.mysqltargetport
      EP = var.mysqlexposedport
    }
  }

}
