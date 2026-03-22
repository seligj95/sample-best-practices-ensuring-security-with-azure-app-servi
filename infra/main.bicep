param location string = 'eastus2'
param environmentName string

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: '${environmentName}-appServicePlan'
  location: location
  sku: {
    name: 'F1'
    tier: 'Free'
  }
}

resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: '${environmentName}-webApp'
  location: location
  serverFarmId: appServicePlan.id
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    httpsOnly: true
  }
}

resource keyVault 'Microsoft.KeyVault/vaults@2022-07-01' = {
  name: '${environmentName}-keyVault'
  location: location
  properties: {
    sku: {
      name: 'standard'
    }
    tenantId: subscription().tenantId
    accessPolicies: []
  }
}