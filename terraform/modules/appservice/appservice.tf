resource "azurerm_service_plan" "test" {
  name                = "${var.application_type}-${var.resource_type}"
  location            = var.location
  resource_group_name = var.resource_group
  os_type             = "Windows"
  sku_name            = "F1"
}

resource "azurerm_windows_web_app" "test" {
  name                = "${var.application_type}-${var.resource_type}"
  location            = var.location
  resource_group_name = var.resource_group
  service_plan_id     = azurerm_service_plan.test.id

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = 0
  }
  site_config {
    always_on = false
  }
}

resource "azurerm_monitor_action_group" "test" {
  name                = "app-metric-alert"
  resource_group_name = var.resource_group
  short_name          = "app-alert"
}

resource "azurerm_monitor_metric_alert" "test" {
  name                 = "app-metric-alert"
  resource_group_name  = var.resource_group
  scopes               = [azurerm_windows_web_app.test.id]
  target_resource_type = "Microsoft.Web/sites"
  description          = "Metric alert"
  severity             = 2

  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "Http4xx"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 0
  }

  action {
    action_group_id = azurerm_monitor_action_group.test.id
  }
}
