Feature: Get Geographic Practice Cost Details API

  Background:
    Given url mdmBaseUrl
    * def getGeographicPracticeCostDetailsPassingWrongURLRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTGetGeographicPracticeCostDetailsValid.json')

  @62092 @MDM
  Scenario: Verify user able to Get GeographicPracticeCostDetails using Valid MDM API Request
    Given path '/api/GetGeographicPracticeCostDetails'
    * request getGeographicPracticeCostDetailsValidRequest
    When method POST
    Then status 200
    * print response

  @62095 @MDM
  Scenario: Verify user able to Get GeographicPracticeCostDetails where passing one Active DOS through request
    Given path '/api/GetGeographicPracticeCostDetails'
    * def getGeographicPracticeCostDetailsPassingOneActiveDOSRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTGetGeographicPracticeCostDetailsPassingOneActiveDOS.json')
    * request getGeographicPracticeCostDetailsPassingOneActiveDOSRequest
    When method POST
    Then status 200
    * print response

  @62096 @MDM
  Scenario: Verify user able to Get GetGeographicPracticeCostDetails where passing all Inactive DOS through request object
    Given path '/api/GetGeographicPracticeCostDetails'
    * def getGeographicPracticeCostDetailsPassingAllInActiveDOSRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTGetGeographicPracticeCostDetailsPassingAllInActiveDOS.json')
    * request getGeographicPracticeCostDetailsPassingAllInActiveDOSRequest
    When method POST
    Then status 200
    * print response

  @62097 @MDM
  Scenario: Verify user able to Get Geographic Practice Cost Details where passing Inactive ZipCode through request object
    Given path '/api/GetGeographicPracticeCostDetails'
    * def getGeographicPracticeCostDetailsPassingInActiveZIPCodesThroughObjectRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTGetGeographicPracticeCostDetailsPassingAllInActiveZIPCodes.json')
    * request getGeographicPracticeCostDetailsPassingInActiveZIPCodesThroughObjectRequest
    When method POST
    Then status 200
    * print response

  @62100 @MDM
  Scenario: Verify user able to Get GetGeographicPracticeCostDetails using Valid DOS and ZipCode as Mandate Parameters removing TokenKey Param from Request Data
    Given path '/api/GetGeographicPracticeCostDetails'
    * def getGeographicPracticeCostDetailsWithoutPassingTokenKeyRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTGetGeographicPracticeCostDetailsWithoutPassingTokenKey.json')
    * request getGeographicPracticeCostDetailsWithoutPassingTokenKeyRequest
    When method POST
    Then status 400
    * print response
    * match response.errors.TokenKey[0] contains "'Token Key' must not be empty."

  @62102 @MDM
  Scenario: Verify user able to Get GetGeographicPracticeCostDetails using Invalid URL with Valid ZipCode and DOS as Mandate Parameters
    Given path '/api/GetGeographicPracticeCostDetail'
    * request getGeographicPracticeCostDetailsPassingWrongURLRequest
    When method POST
    Then status 404
    * print response