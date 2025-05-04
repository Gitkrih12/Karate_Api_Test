Feature: Create ICDLuceneIndex  API

  Background:
    Given url mdmBaseUrl
    * def createICDLuceneIndexRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTCreateICDLuceneIndexRequest.json')

  @49492 @MDM
  Scenario: Verify that user is able to CreateICDLuceneIndex
    Given path '/api/CreateICDLuceneIndex'
    * request createICDLuceneIndexRequest
    When method POST
    Then status 200
    * print response

  @49493 @MDM
  Scenario: Verify that API retuns 404 Not Found (By passing wrong URL)
    Given path '/api/CreateICDLuceneIndexes'
    * request createICDLuceneIndexRequest
    When method POST
    Then status 404
    * print response

  @49494 @MDM
  Scenario: Verify that API retuns 500 internal Server Error (By passing wrong token key)
    Given path '/api/CreateICDLuceneIndex'
    * def createICDLuceneIndexWherePassingWrongTokenRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTCreateICDLuceneIndexWherePassingWrongTokenRequest.json')
    * request createICDLuceneIndexWherePassingWrongTokenRequest
    When method POST
    Then status 200
    * print response

  @49495 @MDM
  Scenario: Verify that API returns 400  BAD request error code (Send Wrong Body)
    Given path '/api/CreateICDLuceneIndex'
    * def createICDLuceneIndexPassingWrongInputObjectRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTCreateICDLuceneIndexPassingWrongInputObjectRequest.json')
    * request createICDLuceneIndexPassingWrongInputObjectRequest
    When method POST
    Then status 400
    * print response