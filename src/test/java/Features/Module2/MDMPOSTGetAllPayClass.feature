Feature: Get All Pay Class  API

  Background:
    Given url mdmBaseUrl
    * def getAllPayClassRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTGetAllPayClassRequest.json')


  @36573 @MDM
  Scenario: Verify MDM GET Pay with Valid MDM API Data
    Given path '/api/GetPayDetails'
    * request getAllPayClassRequest
    When method POST
    Then status 200
    * print response

  @45831 @MDM
  Scenario: Verify MDM GET Pay with Valid MDM API Data For Single MDMCode Details
    Given path '/api/GetPayDetails'
    * def getAllPayClassByPassingSingleMDMCodeRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTGetAllPayClassToFetchSingleMDMCodeInfo.json')
    * request getAllPayClassByPassingSingleMDMCodeRequest
    When method POST
    Then status 200
    * print response

  @36574 @MDM
  Scenario: Verify MDM GET Pay with Invalid MDM API Data by removing Token Key
    Given path '/api/GetPayDetails'
    * def getAllPayClassWithoutPassingTokenKeyRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTGetAllPayClassWithoutPassingTokenKeyRequest.json')
    * request getAllPayClassWithoutPassingTokenKeyRequest
    When method POST
    Then status 400
    * print response
    * match response.errors.TokenKey[0] contains "'Token Key' must not be empty."

  @36575 @MDM
  Scenario: Verify MDM GET Pay with Invalid MDM API Data Passing Wrong URL
    Given path '/api/GetPayDetail'
    * request getAllPayClassRequest
    When method POST
    Then status 404
    * print response
