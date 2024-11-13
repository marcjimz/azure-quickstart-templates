@description('AI Services Id')
param aiServicesPrincipalId string

@description('Search Service Name')
param searchServiceName string

var role = {
  SearchIndexDataContributor : '8ebe5a00-799e-43f5-93ac-243d3dce84a7'
  SearchServiceContributor : '7ca78c08-252a-4471-8644-bb5ff32d4ba0'
  StorageBlobDataReader : '2a2b9908-6ea1-4ae2-8e65-a410df84e7d1'
  StorageBlobDataContributor : 'ba92f5b4-2d11-453d-a403-e96b0029c9fe' 
  CognitiveServicesOpenAiContributor : 'a001fd3d-188f-4b5d-821b-7da978bf7442'
  CognitiveServicesContributor : '25fbc0a9-bd7c-42a3-aa1a-3b75d497ee68'
}

resource searchService 'Microsoft.Search/searchServices@2023-11-01' existing = {
  name: searchServiceName
}

resource searchIndexDataContributor 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(resourceGroup().id, 'SearchIndexDataContributor', searchServiceName)
  scope: searchService
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', role.SearchIndexDataContributor)
    principalId: aiServicesPrincipalId
    principalType: 'ServicePrincipal'
  }
}

resource searchServiceContributor 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(resourceGroup().id, 'SearchServiceContributor', searchServiceName)
  scope: searchService
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', role.SearchServiceContributor)
    principalId: aiServicesPrincipalId
    principalType: 'ServicePrincipal'
  }
}

resource searchServiceStorageBlobDataContributor 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(resourceGroup().id, 'StorageBlobDataContributor', searchServiceName)
  scope: searchService
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', role.StorageBlobDataContributor)
    principalId: aiServicesPrincipalId
    principalType: 'ServicePrincipal'
  }
}

resource searchCognitiveServicesOpenAiContributor 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(resourceGroup().id, 'CognitiveServicesOpenAiContributor', searchServiceName)
  scope: searchService
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', role.CognitiveServicesOpenAiContributor)
    principalId: aiServicesPrincipalId
    principalType: 'ServicePrincipal'
  }
}

resource searchCognitiveServicesContributor 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(resourceGroup().id, 'CognitiveServicesContributor', searchServiceName)
  scope: searchService
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', role.CognitiveServicesContributor)
    principalId: aiServicesPrincipalId
    principalType: 'ServicePrincipal'
  }
}
