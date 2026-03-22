param location string = 'eastus2'
param environmentName string

resource appServicePlan 'Microsoft.Web/serverfarms@2022-09-01' = {
  name: '${environmentName}-appservice-plan'
  location: location
  sku: {
    name: 'B1'
    tier: 'Basic'
  }
}

resource webApp 'Microsoft.Web/sites@2022-09-01' = {
  name: '${environmentName}-webapp'
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    serverFarmId: appServicePlan.id
  }
}

resource keyVault 'Microsoft.KeyVault/vaults@2022-11-01' = {
  name: '${environmentName}-keyvault'
  location: location
  properties: {
    sku: {
      name: 'standard'
    }
    tenantId: subscription().tenantId
    accessPolicies: []
  }
}