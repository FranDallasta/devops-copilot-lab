#!/bin/bash

# 💡 NEW unique names to avoid conflicts
RESOURCE_GROUP="CopilotRG3"
LOCATION="centralus"               # ✅ Not 'eastus'
APP_SERVICE_PLAN="CopilotPlan3"
WEB_APP_NAME="copilotwebapp$RANDOM"

# ✅ Create a new resource group
az group create --name $RESOURCE_GROUP --location $LOCATION

# ✅ Create an App Service Plan in a supported region
az appservice plan create \
  --name $APP_SERVICE_PLAN \
  --resource-group $RESOURCE_GROUP \
  --location $LOCATION \
  --sku FREE

# ✅ Create a Web App using Node 18
az webapp create \
  --name $WEB_APP_NAME \
  --resource-group $RESOURCE_GROUP \
  --plan $APP_SERVICE_PLAN \
  --runtime "node|16-lts"
