#Login-AzureRmAccount

$RGName = "<RG NAME>"
$location = "<LOCATION>"
#Update with path to azuredeploy.json or cd to the appropriate directory before running
$ArmTemplatePath = ".\azuredeploy.json";
$ArmParametersPath = ".\azuredeploy.parameters.json";
$licenseFileContent = Get-Content -Raw -Encoding UTF8 -Path ".\license.xml" | Out-String;

# license file needs to be secure string and adding the params as a hashtable is the only way to do it
$additionalParams = New-Object -TypeName Hashtable;

$params = Get-Content $ArmParametersPath | Out-String | ConvertFrom-Json;

foreach($p in $params.parameters | Get-Member -MemberType *Property)
{
    $additionalParams.Add($p.Name, $params.parameters.$($p.Name).value);
}

$additionalParams.Set_Item('licenseXml', $licenseFileContent);

Write-Host "Check if resource group already exists..."
$notPresent = Get-AzureRmResourceGroup -Name $RGName -ev notPresent -ea 0;
	
if (!$notPresent) 
{
	New-AzureRmResourceGroup -Name $RGName -Location $location;
}
	
Write-Verbose "Starting ARM deployment...";
New-AzureRmResourceGroupDeployment -Name $RGName -ResourceGroupName $RGName -TemplateFile $ArmTemplatePath -TemplateParameterObject $additionalParams -Verbose

Write-Host "Deployment Complete."

