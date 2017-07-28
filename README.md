# Deploy SiteCore to Azure App Service Environment v1 or v2
In order to deploy Site Core into an Azure App Service Environment (ASE) the Azure Marketplace Template will not work. The Marketplace template assumes it is creating the App Service Plan, which then doesnt allow you to choose a plan in an ASE. This template allows you to deploy SiteCore into a pre-existing ASE (v1 or v2) and App Service Plan.

## Deployment
In order to deploy this template you will need the following:

1) SiteCore MSDeploy packages for CM, CD and REP (This can be obtained from SiteCore)
2) SiteCore License.xml file, which is pulled in by the PowerShell deployment script
3) Existing App Service Environment (v1 or v2)
4) Existing App Service Plan within the above mentioned ASE

**Note:** The template can be deployed via the attached link, however I have not tested the license file through this approach, so you may need to manually deploy the license.xml via FTP.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fswgriffith%2FSiteCore_ASE%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

## Parameters File
The following parameters are required to deploy this template:
#### test

#### Location
Deployment Location

#### AppName
Base Name Used for Various Components

#### ASE-Name
App Service Environment Name

#### ASE-ResourceID
Resource ID for the ASE

#### ASE-Plan-ResourceID
Resource ID for the pre-created App Service Plan

#### sitecoreAdminPassword
Password for the sitecore admin user

#### sqlServerFqdn
Name to be used for the Azure SQL instance

#### sqlServerLogin
SQL Server user ID

#### sqlServerPassword
SQL Server Password

#### sitecoreDBUserName
Base SiteCore DB User Name

#### sitecoreDBPassword
Base SiteCore DB Password

#### repReportingSqlDatabaseUserName
Reporting Database User Name

#### repReportingSqlDatabasePassword
Reporting Database Password

#### analyticsConnectionString
Analytics Mongo DB Connection String

#### trackingLiveConnectionString
Tracking Mongo DB Connection String

#### trackingContactConnectionString
Tracking Contact Mongo DB Connection String

#### trackingHistoryMongoDbConnectionString
Tracking History Mongo DB Connection String

#### repAuthenticationApiKey
Reporting Authentication API Key

#### searchServiceName
Azure Search Instance Name

#### redisCacheName
Redis Cache Instance Name

#### securityClientIp
    "value": "0.0.0.0"

#### securityClientIpMask
      "value": "0.0.0.0"

