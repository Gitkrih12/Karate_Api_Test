Feature: Get All Modifiers from Modifiers List  API

  Background:
    Given url mdmBaseUrl
    * def getAllModifiersFromModifiersListRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTGetAllModifiersFromModifiersListRequest.json')

  @45694 @MDM
  Scenario: Verify user able to Get All Modifiers by Modifiers List using Valid CA MDM API data
    Given path '/api/GeAllModifiersDetail'
    * request getAllModifiersFromModifiersListRequest
    When method POST
    Then status 200
    * print response

  @45696 @MDM
  Scenario: Verify user able to Get All Modifiers by Modifiers List using Valid CA MDM API data with only one Modifier
    Given path '/api/GeAllModifiersDetail'
    * def getAllModifiersFromModifiersListPassingOnlyOneModifierRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTGetAllModifiersFromModifiersListWherePassingOnlyOneModifierRequest.json')
    * request getAllModifiersFromModifiersListPassingOnlyOneModifierRequest
    When method POST
    Then status 200
    * print response

  @45697 @MDM
  Scenario: Verify user able to Get All Modifiers by Modifiers List using Inalid CA MDM API with wrong URL
    Given path '/api/GeAllModifiersDetails'
    * request getAllModifiersFromModifiersListRequest
    When method POST
    Then status 404
    * print response

  @45698 @MDM
  Scenario: Verify user able to Get All Modifiers by Modifiers List using Invalid CA MDM API data without TokenKey
    Given path '/api/GeAllModifiersDetail'
    * def getAllModifiersFromModifiersListWithoutPassingTokenKeyRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTGetAllModifiersFromModifiersListWithoutPassingTokenKey.json')
    * request getAllModifiersFromModifiersListWithoutPassingTokenKeyRequest
    When method POST
    Then status 400
    * print response
    * match response.errors.TokenKey[0] contains "'Token Key' must not be empty."