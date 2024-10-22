

resource "azurerm_role_definition" "role_definition" {
  for_each = { for roles in var.role_definitions : roles.role_definition_name => roles }
  name     = each.value.role_definition_name
  scope    = each.value.scope

  permissions {
    actions     = each.value.actions
    not_actions = each.value.not_actions
  }

  assignable_scopes = each.value.assignable_scopes
}

resource "azurerm_role_assignment" "role_assignment" {
  for_each = { for role_assign in var.role_assignments : role_assign.role_definition_name => role_assign }

  name                 = each.value.name
  role_definition_id   = each.value.custom_role_definition == true ? azurerm_role_definition.role_definition[each.key].role_definition_resource_id : null
  role_definition_name = each.value.custom_role_definition == false ? each.value.role_definition_name : null
  scope                = each.value.scope
  principal_id         = each.value.principal_id

  depends_on = [azurerm_role_definition.role_definition]
}

