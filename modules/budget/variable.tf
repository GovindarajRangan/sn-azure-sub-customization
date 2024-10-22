
variable "name" {
  type        = string
  description = "Budget Name"
}

variable "budget_amount" {
  type        = number
  description = "Budget Amount"
}

variable "time_grain" {
  type        = string
  description = "Time grain (Monthly/ Yearly)"
}

variable "start_date" {
  type        = string
  description = "start date of budget"
}

variable "end_date" {
  type        = string
  description = "end date of budget"
}

variable "notifications" {
  type = list(object({
    threshold      = number
    operator       = string
    contact_emails = list(string)
    contact_roles  = list(string)
    threshold_type = string
    enabled        = bool
  }))
  description = "budget notifications "
}

