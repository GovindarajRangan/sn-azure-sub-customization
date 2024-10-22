
variable "role_definitions" {
  type = list(object({
    role_definition_name = string
    scope                = string
    actions              = list(string)
    not_actions          = list(string)
    assignable_scopes    = list(string)
  }))
}


variable "role_assignments" {
  type = list(object({
    name                   = string
    role_definition_name   = string
    principal_id           = string
    scope                  = string
    custom_role_definition = bool
  }))
}