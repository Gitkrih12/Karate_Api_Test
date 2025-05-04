Feature: POST Get Provider Data API

  Background:
    Given url pvBaseUrl
    * def getProviderData = read("classpath:Payloads/PVAPIs/PVPOSTGetProviderData-"+karate.env+".json")

  @45206 @PV
  Scenario: Verify that user is able to GetProviderDetails
    Given path '/api/GetProviderData'
    * request getProviderData
    When method POST
    Then status 200
    * print response

  @45218 @PV
  Scenario: Verify that API returns 400  BAD request error code (Send Wrong Body)
    Given path '/api/GetProviderData'
    * def providerDataWrongObjectRequestBody = read('classpath:Payloads/PVAPIs/PVPOSTGetProviderDatawrongObject.json')
    * request providerDataWrongObjectRequestBody
    When method POST
    Then status 400
    * print response

  @45210 @PV
  Scenario: Verify that API returns 500 internal Server Error (By passing wrong token key)
    Given path '/api/GetProviderData'
    * def providerDataPassingWrongTokenRequestBody = read('classpath:Payloads/PVAPIs/PVPOSTGetProviderDataPassingWrongTokenKey.json')
    * request providerDataPassingWrongTokenRequestBody
    When method POST
    Then status 500
    * print response

  @45209 @PV
  Scenario: Verify that API returns 404 Not Found (By passing wrong URL)
    Given path '/api/GetProviderDatas'
#    * def providerDataRequestBody = read('classpath:Payloads/PVPOSTGetProviderData.json')
    * request getProviderData
    When method POST
    Then status 404
    * print response