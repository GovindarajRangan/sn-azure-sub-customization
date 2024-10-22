resource "azurerm_consumption_budget_subscription" "subscription_budget" {
  name            = var.name
  subscription_id = data.azurerm_subscription.current.id
  amount          = var.budget_amount
  time_grain      = var.time_grain
  time_period {
    start_date = var.start_date
    end_date   = var.end_date
  }

  dynamic "notification" {
    for_each = var.notifications
    content {
      enabled        = notification.value.enabled
      threshold      = notification.value.threshold
      operator       = notification.value.operator
      contact_emails = notification.value.contact_emails
      contact_roles  = notification.value.contact_roles
      threshold_type = notification.value.threshold_type
    }
  }

}