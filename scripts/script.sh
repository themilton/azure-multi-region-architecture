# Variables
RG_EAST="rg-app-eastus"
RG_WEST="rg-app-westus"
LOCATION_EAST="eastus"
LOCATION_WEST="westus"
SQL_SERVER="sql-app-eastus"
SQL_DB="appdb"

# Create resource groups
az group create --name $RG_EAST --location $LOCATION_EAST
az group create --name $RG_WEST --location $LOCATION_WEST

# Create VNets
az network vnet create \
    --resource-group $RG_EAST \
    --name vnet-east \
    --address-prefix 10.1.0.0/16 \
    --subnet-name app \
    --subnet-prefix 10.1.1.0/24

az network vnet create \
    --resource-group $RG_WEST \
    --name vnet-west \
    --address-prefix 10.2.0.0/16 \
    --subnet-name app \
    --subnet-prefix 10.2.1.0/24

# Peer the VNets
az network vnet peering create \
    --resource-group $RG_EAST \
    --name east-to-west \
    --vnet-name vnet-east \
    --remote-vnet /subscriptions/$SUB_ID/resourceGroups/$RG_WEST/providers/Microsoft.Network/virtualNetworks/vnet-west \
    --allow-vnet-access

az network vnet peering create \
    --resource-group $RG_WEST \
    --name west-to-east \
    --vnet-name vnet-west \
    --remote-vnet /subscriptions/$SUB_ID/resourceGroups/$RG_EAST/providers/Microsoft.Network/virtualNetworks/vnet-east \
    --allow-vnet-access
