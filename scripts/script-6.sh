# Create NSG for app subnet
az network nsg create \
    --resource-group $RG_EAST \
    --name nsg-app-east

# Allow only HTTPS inbound from Front Door
az network nsg rule create \
    --resource-group $RG_EAST \
    --nsg-name nsg-app-east \
    --name AllowFrontDoor \
    --priority 100 \
    --source-address-prefixes AzureFrontDoor.Backend \
    --destination-port-ranges 443 \
    --access Allow \
    --protocol Tcp

# Deny all other inbound
az network nsg rule create \
    --resource-group $RG_EAST \
    --nsg-name nsg-app-east \
    --name DenyAllInbound \
    --priority 4096 \
    --source-address-prefixes '*' \
    --destination-port-ranges '*' \
    --access Deny \
    --protocol '*'

# Private endpoints for SQL and Redis
az network private-endpoint create \
    --resource-group $RG_EAST \
    --name pe-sql-east \
    --vnet-name vnet-east \
    --subnet endpoints \
    --private-connection-resource-id $SQL_SERVER_ID \
    --group-ids sqlServer \
    --connection-name sql-private
