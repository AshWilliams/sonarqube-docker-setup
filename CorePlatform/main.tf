provider "azurerm" {
    version = "=2.0.0"
    features {}
}

resource "azurerm_resource_group" "shared"{
    name = "autoseguro-shared-brasil-rg"
    location = var.location

    tags = {
        DuenoProyecto = var.DuenoProyecto
        ResponsableTecnico = var.ResponsableTecnico
        NombreProyecto = var.NombreProyecto
        CentroDeCosto = var.CentroDeCosto
        TipoAmbiente = var.TipoAmbiente
    }
}

module "SQLAzure" {
    source              = "./modules/SQLAzure"

    resource_group_name = azurerm_resource_group.shared.name
    location            = azurerm_resource_group.shared.location

    SQLUser = var.SQLUser
    SQLPassword = var.SQLPassword
    sql_server = var.sql_server
    sql_database = var.sql_database

    DuenoProyecto = var.DuenoProyecto
    ResponsableTecnico = var.ResponsableTecnico
    NombreProyecto = var.NombreProyecto
    CentroDeCosto = var.CentroDeCosto
    TipoAmbiente = var.TipoAmbiente
}

resource "azurerm_container_registry" "shared" {
    name                     = "acrsonarqubeprod"
    resource_group_name      = azurerm_resource_group.shared.name
    location                 = azurerm_resource_group.shared.location
    sku                      = "Basic"
    admin_enabled            = false

    tags = {
        DuenoProyecto = var.DuenoProyecto
        ResponsableTecnico = var.ResponsableTecnico
        NombreProyecto = var.NombreProyecto
        CentroDeCosto = var.CentroDeCosto
        TipoAmbiente = var.TipoAmbiente
    }
}