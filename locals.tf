locals {
  traffic_manager_profile = { for traffic_manager_profile in var.traffic_manager_profile_list : traffic_manager_profile.name => traffic_manager_profile }
}