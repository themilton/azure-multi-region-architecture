# Create Traffic Manager profile
az network traffic-manager profile create \
    --name tm-app \
    --resource-group $RG_EAST \
    --routing-method Priority \
    --unique-dns-name myapp-tm \
    --monitor-protocol HTTPS \
    --monitor-port 443 \
    --monitor-path "/healthz" \
    --monitor-interval 10 \
    --monitor-timeout 5 \
    --monitor-failures 3

# Add endpoints
az network traffic-manager endpoint create \
    --resource-group $RG_EAST \
    --profile-name tm-app \
    --name east-endpoint \
    --type azureEndpoints \
    --target-resource-id $EAST_APP_ID \
    --priority 1 \
    --endpoint-status Enabled

az network traffic-manager endpoint create \
    --resource-group $RG_EAST \
    --profile-name tm-app \
    --name west-endpoint \
    --type azureEndpoints \
    --target-resource-id $WEST_APP_ID \
    --priority 2 \
    --endpoint-status Enabled
