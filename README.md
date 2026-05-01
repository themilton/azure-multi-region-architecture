# Azure Multi-Region Fault-Tolerant Architecture

Designing a multi-region Azure architecture for "five nines of availability" on a $2,800/month budget — the architecture decisions, cost traps, networking setup, and the disaster recovery strategy that actually saved us during an East US outage.

## Stack

- **App tier**: FastAPI on Azure App Service (P1v3) + AKS for background workers
- **Data tier**: Azure SQL (Standard S3) with active geo-replication, Redis Cache (Standard C1)
- **Networking**: VNet peering across regions, Azure Front Door + Traffic Manager
- **Observability**: Application Insights, Log Analytics workspace
- **Disaster recovery**: East US (primary) → West US (warm standby), automated failover via Traffic Manager priority routing
- **Budget**: ~$2,800/month, RPO < 5 min, RTO < 15 min

## Topics

`Azure` · `Cloud Architecture` · `DevOps` · `Networking` · `Disaster Recovery`

## Read the full write-up

[reshamchaudhary.com/blog/azure-multi-region-architecture](https://reshamchaudhary.com/blog/azure-multi-region-architecture)

The blog post covers the architecture diagram, every resource and its sizing, the cost breakdown, the networking decisions (and the ones I got wrong on the first pass), and the actual outage where the failover paid for itself.
