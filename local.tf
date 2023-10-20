locals {
  app_owner = [
    data.azuread_client_config.current.object_id,
    data.azuread_user.power_bi_owner.object_id
  ]
}
