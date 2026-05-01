# Create failover group
az sql failover-group create \
    --name fg-app \
    --partner-server sql-app-westus \
    --resource-group $RG_EAST \
    --server $SQL_SERVER \
    --failover-policy Automatic \
    --grace-period 1

# Check failover group status
$ az sql failover-group show \
    --name fg-app \
    --resource-group $RG_EAST \
    --server $SQL_SERVER \
    --output table

Name    ResourceGroup    ReplicationRole  ReplicationState  FailoverPolicy  GracePeriod
------  ---------------  ---------------  ----------------  --------------  -----------
fg-app  rg-app-eastus    PRIMARY          CATCH_UP          Automatic       60
