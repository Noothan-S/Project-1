locals {
  app_owner = [
    data.azuread_client_config.current.object_id,
    data.azuread_user.power_bi_owner.object_id
  ]
}

locals {
  project_name  = lower("${var.project_name}%{if var.suffix != ""}-${var.suffix}%{endif}")
  name_squished = replace(local.project_name, "-", "")
}

