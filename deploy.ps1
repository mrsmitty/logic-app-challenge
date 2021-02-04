param (
    $n,
    $l = "australiaeast"
)

az group create -n $n -l $l
az deployment group create --resource-group $n --template-file azuredeploy.json