Feature: Create All HIPPSLuceneIndex  API

  Background:
    Given url mdmBaseUrl
    * def createHIPPSLuceneIndexRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTCreateHIPPSLuceneIndexRequest.json')

  @49759 @MDM
  Scenario: Verify that user is able to CreateHIPPSLuceneIndex
    Given path '/api/CreateHIPPSLuceneIndex'
    * request createHIPPSLuceneIndexRequest
    When method POST
    Then status 200
    * print response

  @49762 @MDM
  Scenario: Verify that API returns 400  BAD request error code (Send Wrong Body)
    Given path '/api/CreateHIPPSLuceneIndex'
    * def createHIPPSLuceneIndexPassingWrongInputRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTCreateHIPPSLuceneIndexPassingWrongInputRequest.json')
    * request createHIPPSLuceneIndexPassingWrongInputRequest
    When method POST
    Then status 400
    * print response

  @49760 @MDM
  Scenario: Verify that API returns 404 Not Found (By passing wrong URL)
    Given path '/api/CreateHIPPSLuceneIndax'
    * request createHIPPSLuceneIndexRequest
    When method POST
    Then status 404
    * print response

  @49761 @MDM
  Scenario: Verify that API returns 500 internal Server Error (By passing wrong token key)
    Given path '/api/CreateHIPPSLuceneIndex'
    * def createHIPPSLuceneIndexRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTCreateHIPPSLuceneIndexWherePassingWrongTokenRequest.json')
    * request createHIPPSLuceneIndexRequest
    When method POST
    Then status 500
    * print response