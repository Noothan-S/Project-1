#!/bin/bash

# RESOURCE_GROUP_NAME=tfstate
# STORAGE_ACCOUNT_NAME=tfstate$RANDOM
# CONTAINER_NAME=tfstate

RESOURCE_GROUP_NAME=noo-tfstate-rg
STORAGE_ACCOUNT_NAME=nootf0012
CONTAINER_NAME=nootfstatefiles

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location eastus
# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob
# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME


