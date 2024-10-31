
subscription_id = "108b20ee-f7b8-4541-af7e-c39e604732e0"
## Common Tags

common_tags = {
  "Environment"   = "PROD"
  "Company" = "PwCParentCo"
}

## Resource Groups
resource_groups = [
  {
    rg_name  = "parentco-network-rg-eastus",
    location = "East US"
  }
]

## Vnets
vnets = [
  {
    name                = "parentco-lz-vnet-01"
    address_space       = ["10.1.0.0/16"]
    resource_group_name = "parentco-network-rg-eastus"
    dns_servers         = ["10.1.0.7"]
  }
]

## Subnets
subnets = [
  {
    name                 = "parentco-lz-subnet-01"
    virtual_network_name = "parentco-lz-vnet-01"
    address_prefixes     = ["10.1.1.0/24"]
    resource_group_name  = "parentco-network-rg-eastus"
  },
  {
    name                 = "parentco-lz-subnet-02"
    virtual_network_name = "parentco-lz-vnet-01"
    address_prefixes     = ["10.1.2.0/24"]
    resource_group_name  = "parentco-network-rg-eastus"
  }
]

## nsg
nsg = [
  {
    name           = "parentco-lz-nsg-01",
    resource_group = "parentco-network-rg-eastus",
    subnet         = "parentco-lz-subnet-01"
    vnet_name      = "parentco-lz-vnet-01"
  },
  {
    name           = "parentco-lz-nsg-02",
    resource_group = "parentco-network-rg-eastus",
    subnet         = "parentco-lz-subnet-02"
    vnet_name      = "parentco-lz-vnet-01"
  }
]

nsg_rules = [
  {
    name                       = "parentco-lz-nsg-rule-snet1-inbound-https"
    access                     = "Allow",
    protocol                   = "Tcp",
    direction                  = "Inbound",
    source_port_range          = "443",
    destination_port_range     = "443",
    priority                   = "110",
    source_address_prefix      = "*",
    destination_address_prefix = "*",
    nsg_name                   = "parentco-lz-nsg-01"
    resource_group             = "parentco-network-rg-eastus"
  },
  {
    name                       = "parentco-lz-nsg-rule-snet2-inbound-https"
    access                     = "Allow",
    protocol                   = "Tcp",
    direction                  = "Inbound",
    source_port_range          = "443",
    destination_port_range     = "443",
    priority                   = "110",
    source_address_prefix      = "*",
    destination_address_prefix = "*",
    nsg_name                   = "parentco-lz-nsg-01"
    resource_group             = "parentco-network-rg-eastus"
  },
]


## Route Table

route_tables = [
  {
    name                          = "parentco-lz-routetable-01"
    resource_group_name           = "parentco-network-rg-eastus"
    disable_bgp_route_propagation = false
    subnet         = "parentco-lz-subnet-02"
    vnet_name      = "parentco-lz-vnet-01"
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
    name          = "ParentCo-Monthly-Budget"
    budget_amount = 1000
    time_grain    = "Monthly"
    start_date    = "2024-09-01T00:00:00Z"
    end_date      = "2026-08-31T00:00:00Z"

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