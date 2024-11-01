subscription_id = "3d890c0c-6728-4cfa-97ac-a57a2b09b47d"
## Common Tags

common_tags = {
  "Environment"   = "PROD"
  "Company" = "PwCCarveCo"
}

## Resource Groups
resource_groups = [
  {
    rg_name  = "carveco-network-rg-eastus",
    location = "East US"
  }
]

## Vnets
vnets = [
  {
    name                = "carveco-lz-vnet-01"
    address_space       = ["10.1.0.0/16"]
    resource_group_name = "carveco-network-rg-eastus"
    dns_servers         = ["10.1.0.7"]
  }
]

## Subnets
subnets = [
  {
    name                 = "carveco-lz-subnet-01"
    virtual_network_name = "carveco-lz-vnet-01"
    address_prefixes     = ["10.1.1.0/24"]
    resource_group_name  = "carveco-network-rg-eastus"
  },
  {
    name                 = "carveco-lz-subnet-02"
    virtual_network_name = "carveco-lz-vnet-01"
    address_prefixes     = ["10.1.2.0/24"]
    resource_group_name  = "carveco-network-rg-eastus"
  }
]

## nsg
nsg = [
  {
    name           = "carveco-lz-nsg-01",
    resource_group = "carveco-network-rg-eastus",
    subnet         = "carveco-lz-subnet-01"
    vnet_name      = "carveco-lz-vnet-01"
  },
  {
    name           = "carveco-lz-nsg-02",
    resource_group = "carveco-network-rg-eastus",
    subnet         = "carveco-lz-subnet-02"
    vnet_name      = "carveco-lz-vnet-01"
  }
]

nsg_rules = [
  {
    name                       = "carveco-lz-nsg-rule-snet1-inbound-https"
    access                     = "Allow",
    protocol                   = "Tcp",
    direction                  = "Inbound",
    source_port_range          = "443",
    destination_port_range     = "443",
    priority                   = "110",
    source_address_prefix      = "*",
    destination_address_prefix = "*",
    nsg_name                   = "carveco-lz-nsg-01"
    resource_group             = "carveco-network-rg-eastus"
  }
]


## Route Table

route_tables = [
  {
    name                          = "carveco-lz-routetable-01"
    resource_group_name           = "carveco-network-rg-eastus"
    disable_bgp_route_propagation = false
    subnet         = "carveco-lz-subnet-01"
    vnet_name      = "carveco-lz-vnet-01"
    routes = [
      {
        name           = "vnet-local"
        address_prefix = "10.1.0.0/16"
        next_hop_type  = "VnetLocal"
      }
    ]
  }
]


## Budget

budget_details = [
  {
    name          = "carveCo-Monthly-Budget"
    budget_amount = 1000
    time_grain    = "Monthly"
    start_date    = "2025-01-01T00:00:00Z"
    end_date      = "2027-12-31T00:00:00Z"

    notifications = [
      {
        threshold      = 80.0 # 80% usage
        operator       = "GreaterThan"
        contact_emails = ["azaam.jamil@pwc.com"]
        contact_roles  = ["Owner", "Contributor"]
        threshold_type = "Forecasted"
        enabled        = true
      },
      {
        threshold      = 100.0 # 80% usage
        operator       = "GreaterThan"
        contact_emails = ["azaam.jamil@pwc.com"]
        contact_roles  = ["Owner", "Contributor"]
        threshold_type = "Forecasted"
        enabled        = true
      }
    ]
  }
]

### RBAC Roles

role_definitions = [
#   {
#     role_definition_name = "00000000-0000-0000-0000-000000000001"
#     scope                = "/subscriptions/731257cc-4ff2-4612-b6b0-3463b086522f"
#     actions              = ["*"]
#     not_actions          = ["*"]
#     assignable_scopes    = ["/subscriptions/731257cc-4ff2-4612-b6b0-3463b086522f"]
#   }
]

role_assignments = [
#   { name                   = "00000000-0000-0000-0000-000000000003"
#     role_definition_name   = "00000000-0000-0000-0000-000000000001"
#     principal_id           = "429a5f5f-5764-4031-a7f4-a0a499fc3c52"
#     scope                  = "/subscriptions/731257cc-4ff2-4612-b6b0-3463b086522f"
#     custom_role_definition = true
#   },
#   { name                   = "00000000-0000-0000-0000-000000000004"
#     role_definition_name   = "Reader"
#     principal_id           = "429a5f5f-5764-4031-a7f4-a0a499fc3c52"
#     scope                  = "/subscriptions/731257cc-4ff2-4612-b6b0-3463b086522f"
#     custom_role_definition = false
#   }
]

virtual_machines = [
]