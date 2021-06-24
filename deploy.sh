#!/bin/bash

RG=$1
LOCATION=$2
PARAMPATH=$3

if [[ -z $RG ]] || [[ -z $LOCATION ]]; then
    echo "Must provide resource group and LOCATION argument"
    echo "Usage:"
    echo "  ./deploy.sh <resource group> <location>"
    echo "  ./deploy.sh <resource group> <location> <parameter path>"
    echo "Example: ./deploy.sh test-syd-arg-logicapp australiaeast params.json"
    exit 1
fi

az group create -n $RG -l $LOCATION
if [[ -f "$PARAMPATH" ]]; then

    az deployment group create --resource-group $RG --template-file azuredeploy.json --parameter @"${PARAMPATH}"
else
    az deployment group create --resource-group $RG --template-file azuredeploy.json
fi
