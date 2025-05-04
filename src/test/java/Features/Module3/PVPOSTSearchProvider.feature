Feature: POST Search Provider

  Background:
    Given url pvBaseUrl
    * def searchProvider = read("classpath:Payloads/PVAPIs/PVPOSTSearchProvider-"+karate.env+".json")

  @51826 @PV
  Scenario: Verify that user is able to GetSearchProvider details
    Given path '/api/SearchProvider'
    * request searchProvider
    When method POST
    Then status 200
    * print response

  @51830 @PV
  Scenario: Verify that API returns 404 Not found by passing empty field Values
    Given path '/api/SearchProvider'
    * def searchProviderPassingEmptyFieldValueRequestBody = read('classpath:Payloads/PVAPIs/PVPOSTSearchProviderPassingEmptyFieldValue.json')
    * request searchProviderPassingEmptyFieldValueRequestBody
    When method POST
    Then status 404
    * print response

  @51827 @PV
  Scenario: Verify that API returns 404 Not Found (By passing wrong URL)
    Given path '/api/SearchProviders'
    * request searchProvider
    When method POST
    Then status 404
    * print response

  @51828 @PV
  Scenario: Verify that API returns 500 internal Server Error (By passing wrong token key)
    Given path '/api/SearchProvider'
    * def searchProviderPassingWrongTokenRequestBody = read('classpath:Payloads/PVAPIs/PVPOSTSearchProviderWherePassingWrongToken.json')
    * request searchProviderPassingWrongTokenRequestBody
    When method POST
    Then status 500
    * print response

  @51829 @PV
  Scenario: Verify that API returns 400  BAD request error code (Send Wrong Body)
    Given path '/api/SearchProvider'
    * def searchProviderPassingWrongObjectRequestBody = read('classpath:Payloads/PVAPIs/PVPOSTSearchProviderWherePassingWrongData.json')
    * request searchProviderPassingWrongObjectRequestBody
    When method POST
    Then status 400
    * print response