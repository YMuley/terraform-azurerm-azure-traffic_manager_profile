resource "azurerm_traffic_manager_profile" "traffic_manager_profile" {
  for_each               = local.traffic_manager_profile
  name                   = each.value.name
  resource_group_name    = var.resource_group_output[each.value.resource_group_name].name
  traffic_routing_method = each.value.traffic_routing_method
  tags                = each.value.tags == null ? var.default_values.tags : each.value.tags
  dynamic "dns_config" {
    for_each = each.value.dns_config
    content {
    relative_name = dns_config.value.relative_name
    ttl           = dns_config.value.ttl
    }
  }

  dynamic "monitor_config" {
    for_each = each.value.monitor_config
    content {
    protocol                     = monitor_config.value.protocol
    port                         = monitor_config.value.port
    path                         = monitor_config.value.path
    interval_in_seconds          = monitor_config.value.interval_in_seconds
    timeout_in_seconds           = monitor_config.value.timeout_in_seconds
    tolerated_number_of_failures = monitor_config.value.tolerated_number_of_failures
    }
  }
}