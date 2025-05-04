Feature: Get DRG Description Details API

  Background:
    Given url mdmBaseUrl
    * def drgDescriptionDetailsRequestBody = read('classpath:Payloads/MDMAPIs/MDMPOSTGetDRGDescriptionDetailsRequest.json')

  @71898 @MDM
  Scenario: Verify DRG Description Details with Valid MDM API Value Based on DRG Codes
    Given path '/api/GetDRGDescriptionDetails'
    * request drgDescriptionDetailsRequestBody
    When method POST
    Then status 200
    * print response

  @71899 @MDM
  Scenario: Verify DRG Description Details with Valid MDM API Value with different DRG Codes
    Given path '/api/GetDRGDescriptionDetails'
    * def drgDescriptionDetailsWithDifferentDRGCodesRequestBody = read('classpath:Payloads/MDMAPIs/MDMPOSTGetDRGDescriptionDetailsWithDifferentDRGCodesRequest.json')
    * request drgDescriptionDetailsWithDifferentDRGCodesRequestBody
    When method POST
    Then status 200
    * print response

  @71900 @MDM
  Scenario: Verify DRG Description Details with Invalid MDM API data
    Given path '/api/GetDRGDescriptionDetail'
    * request drgDescriptionDetailsRequestBody
    When method POST
    Then status 404
    * print response