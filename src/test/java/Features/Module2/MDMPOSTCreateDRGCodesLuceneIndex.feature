Feature: Create DRGCodesLuceneIndex  API

  Background:
    Given url mdmBaseUrl
    * def createDRGLuceneIndexRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTCreateDRGLuceneIndexRequest.json')

  @49765 @MDM
  Scenario: Verify that user is able to CreateDRGLuceneIndex
    Given path '/api/CreateDRGCodesLuceneIndex'
    * request createDRGLuceneIndexRequest
    When method POST
    Then status 200
    * print response

  @49766 @MDM
  Scenario: Verify that API returns 404 Not Found (By passing wrong URL)
    Given path '/api/CreateDRGCodesLuceneIndexes'
    * request createDRGLuceneIndexRequest
    When method POST
    Then status 404
    * print response

  @49767 @MDM
  Scenario: Verify user able to Create Lucene Index By Passing Wrong Token
    Given path '/api/CreateDRGCodesLuceneIndex'
    * def createDRGLuceneIndexWrongTokenRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTCreateDRGCodesLuceneIndexWherePassingWrongTokenRequest.json')
    * request createDRGLuceneIndexWrongTokenRequest
    When method POST
    Then status 200
    * print response

  @49768 @MDM
  Scenario: Verify that API returns 400  BAD request error code (Send Wrong Body)
    Given path '/api/CreateDRGCodesLuceneIndex'
    * def createCPTLuceneIndexPassingWrongInputObjectRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTCreateDRGLuceneIndexPassingWrongInputObjectRequest.json')
    * request createCPTLuceneIndexPassingWrongInputObjectRequest
    When method POST
    Then status 400
    * print response