resource "azurerm_sql_server" "shared" {
    name                         = var.sql_server
    resource_group_name          = var.resource_group_name
    location                     = var.location
    version                      = "12.0"
    administrator_login          = var.SQLUser
    administrator_login_password = var.SQLPassword

    tags = {
        DuenoProyecto = var.DuenoProyecto
        ResponsableTecnico = var.ResponsableTecnico
        NombreProyecto = var.NombreProyecto
        CentroDeCosto = var.CentroDeCosto
        TipoAmbiente = var.TipoAmbiente
    }
}

resource "azurerm_sql_database" "shared" {
    name                             = var.sql_database
    resource_group_name              = var.resource_group_name
    location                         = var.location
    server_name                      = azurerm_sql_server.shared.name
    edition                          = "Basic"
    collation                        = "SQL_Latin1_General_CP1_CI_AS"
    create_mode                      = "Default"
    requested_service_objective_name = "Basic"

    tags = {
        DuenoProyecto = var.DuenoProyecto
        ResponsableTecnico = var.ResponsableTecnico
        NombreProyecto = var.NombreProyecto
        CentroDeCosto = var.CentroDeCosto
        TipoAmbiente = var.TipoAmbiente
    }
}

# Enables the "Allow Access to Azure services" box as described in the API docs
# https://docs.microsoft.com/en-us/rest/api/sql/firewallrules/createorupdate
resource "azurerm_sql_firewall_rule" "shared" {
    name                = "allow-azure-services"
    resource_group_name = var.resource_group_name
    server_name         = azurerm_sql_server.shared.name
    start_ip_address    = "0.0.0.0"
    end_ip_address      = "0.0.0.0"
}
