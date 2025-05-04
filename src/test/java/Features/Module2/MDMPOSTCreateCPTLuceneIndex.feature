Feature: Create CPTLuceneIndex  API

  Background:
    Given url mdmBaseUrl
    * def createCPTLuceneIndexRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTCreateCPTLuceneIndexRequest.json')

  @49523 @MDM
  Scenario: Verify that user is able to CreateCPTLuceneIndex
    Given path '/api/CreateCPTLuceneIndex'
    * request createCPTLuceneIndexRequest
    When method POST
    Then status 200
    * print response

  @49524 @MDM
  Scenario: Verify that API retuns 404 Not Found (By passing wrong URL)
    Given path '/api/CreateCPTLuceneIndexes'
    * request createCPTLuceneIndexRequest
    When method POST
    Then status 404
    * print response

  @49525 @MDM
  Scenario: Verify user able to Create Lucene Index By Passing Wrong Token
    Given path '/api/CreateCPTLuceneIndex'
    * def createCPTLuceneIndexRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTCreateCPTLuceneIndexWherePassingWrongTokenRequest.json')
    * request createCPTLuceneIndexRequest
    When method POST
    Then status 200
    * print response

  @49526 @MDM
  Scenario: Verify that API returns 400  BAD request error code (Send Wrong Body)
    Given path '/api/CreateCPTLuceneIndex'
    * def createCPTLuceneIndexRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTCreateCPTLuceneIndexPassingWrongInputObjectRequest.json')
    * request createCPTLuceneIndexRequest
    When method POST
    Then status 400
    * print response