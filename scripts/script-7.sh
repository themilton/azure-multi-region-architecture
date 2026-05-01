# Create alert for response time > 2s
az monitor metrics alert create \
    --name "High Response Time" \
    --resource-group $RG_EAST \
    --scopes $APP_SERVICE_ID \
    --condition "avg requests/duration > 2000" \
    --window-size 5m \
    --evaluation-frequency 1m \
    --action-group ag-oncall

# Alert for error rate > 5%
az monitor metrics alert create \
    --name "High Error Rate" \
    --resource-group $RG_EAST \
    --scopes $APP_SERVICE_ID \
    --condition "avg requests/failed > 5" \
    --window-size 5m \
    --evaluation-frequency 1m \
    --action-group ag-oncall

# Alert for SQL DTU > 80%
az monitor metrics alert create \
    --name "SQL DTU High" \
    --resource-group $RG_EAST \
    --scopes $SQL_DB_ID \
    --condition "avg dtu_consumption_percent > 80" \
    --window-size 10m \
    --evaluation-frequency 5m \
    --action-group ag-oncall
