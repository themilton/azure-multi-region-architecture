$ az sql db replica list-links \
    --resource-group $RG_EAST \
    --server $SQL_SERVER \
    --name $SQL_DB \
    --output table

PartnerServer       PartnerDatabase  ReplicationState  PercentComplete  Role
------------------  ---------------  ----------------  ---------------  ---------
sql-app-westus      appdb            CATCH_UP          100              SECONDARY
