provider "azurerm" {
    version = "=2.0.0"
    features {}
}

resource "azurerm_resource_group" "shared"{
    name = "autoseguro-shared-brasil-rg"
    location = "Brazil South"

    tags = {
        DueñoProyecto = var.DuenoProyecto
        ResponsableTecnico = var.ResponsableTecnico
        NombreProyecto = var.NombreProyecto
        CentroDeCostos = var.CentroDeCosto
        TipoAmbiente = var.TipoAmbiente
    }
}

resource "azurerm_sql_server" "shared" {
    name                         = "sql-sonarqube-shared-andresi"
    resource_group_name          = azurerm_resource_group.shared.name
    location                     = azurerm_resource_group.shared.location
    version                      = "12.0"
    administrator_login          = var.SQLUser
    administrator_login_password = var.SQLPassword

    tags = {
        DueñoProyecto = var.DuenoProyecto
        ResponsableTecnico = var.ResponsableTecnico
        NombreProyecto = var.NombreProyecto
        CentroDeCostos = var.CentroDeCosto
        TipoAmbiente = var.TipoAmbiente
    }
}

resource "azurerm_sql_database" "shared" {
    name                             = "sqldb-sonarqube-prod"
    resource_group_name              = azurerm_resource_group.shared.name
    location                         = azurerm_resource_group.shared.location
    server_name                      = azurerm_sql_server.shared.name
    edition                          = "Basic"
    collation                        = "SQL_Latin1_General_CP1_CI_AS"
    create_mode                      = "Default"
    requested_service_objective_name = "Basic"

    tags = {
        DueñoProyecto = var.DuenoProyecto
        ResponsableTecnico = var.ResponsableTecnico
        NombreProyecto = var.NombreProyecto
        CentroDeCostos = var.CentroDeCosto
        TipoAmbiente = var.TipoAmbiente
    }
}

# Enables the "Allow Access to Azure services" box as described in the API docs
# https://docs.microsoft.com/en-us/rest/api/sql/firewallrules/createorupdate
resource "azurerm_sql_firewall_rule" "shared" {
    name                = "allow-azure-services"
    resource_group_name = azurerm_resource_group.shared.name
    server_name         = azurerm_sql_server.shared.name
    start_ip_address    = "0.0.0.0"
    end_ip_address      = "0.0.0.0"
}

resource "azurerm_container_registry" "shared" {
    name                     = "acrsonarqubeshared"
    resource_group_name      = azurerm_resource_group.shared.name
    location                 = azurerm_resource_group.shared.location
    sku                      = "Basic"
    admin_enabled            = false

    tags = {
        DueñoProyecto = var.DuenoProyecto
        ResponsableTecnico = var.ResponsableTecnico
        NombreProyecto = var.NombreProyecto
        CentroDeCostos = var.CentroDeCosto
        TipoAmbiente = var.TipoAmbiente
    }
}