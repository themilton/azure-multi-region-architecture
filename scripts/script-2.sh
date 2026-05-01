# Create primary SQL server + database
az sql server create \
    --name $SQL_SERVER \
    --resource-group $RG_EAST \
    --location $LOCATION_EAST \
    --admin-user sqladmin \
    --admin-password "$SQL_PASSWORD"

az sql db create \
    --resource-group $RG_EAST \
    --server $SQL_SERVER \
    --name $SQL_DB \
    --service-objective S3 \
    --backup-storage-redundancy Geo

# Create geo-replica in West
az sql db replica create \
    --resource-group $RG_EAST \
    --server $SQL_SERVER \
    --name $SQL_DB \
    --partner-server sql-app-westus \
    --partner-resource-group $RG_WEST
