param (
    $resourceGroupName,
    $location,
    [switch] $useParamsFile 
)

az group create -n $resourceGroupName -l $location
if ($useParamsFile) {
    az deployment group create --resource-group $resourceGroupName --template-file azuredeploy.json --parameter-file @parameters.json
} else {
    az deployment group create --resource-group $resourceGroupName --template-file azuredeploy.json
}
