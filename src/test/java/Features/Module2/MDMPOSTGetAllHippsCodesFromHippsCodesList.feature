Feature: Get All Hipps Codes from Hipps Codes List  API

  Background:
    Given url mdmBaseUrl
    * def getAllHippsCodesFromHippsCodesListRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTGetAllHippsCodesFromHippsCodesListRequest.json')

  @46598 @MDM
  Scenario: Verify that user is able to Get All HIPPS Codes From HIPPS Codes List
    Given path '/api/GetAllHIPPSCodesFromHIPPSCodesList'
    * request getAllHippsCodesFromHippsCodesListRequest
    When method POST
    Then status 200
    * print response

  @46599 @MDM
  Scenario: Verify that API returns 404  Not Found code (Send Wrong URL)
    Given path '/api/GetAllHIPPSCodesFromHIPPSCodesLists'
    * request getAllHippsCodesFromHippsCodesListRequest
    When method POST
    Then status 404
    * print response