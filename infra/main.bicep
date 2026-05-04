targetScope = 'resourceGroup'

param location string
param aksName string
param dnsPrefix string

module aks './modules/aks.bicep' = {
  name: 'aksDeploy'
  params: {
    location: location
    aksName: aksName
    dnsPrefix: dnsPrefix
  }
}
