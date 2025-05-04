Feature: Get All CPT Codes From CPT Codes List  API

  Background:
    Given url mdmBaseUrl
    * def getAllCPTCodesFromCPTCodesListRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTGetCPTCodesFromCPTCodesListRequest.json')

  @46340 @MDM
  Scenario: Verify that user is able to get all GetAllCPTCodesFromCPTCodesList
    Given path '/api/GetAllCPTCodesFromCPTCodesList'
    * request getAllCPTCodesFromCPTCodesListRequest
    When method POST
    Then status 200
    * print response

  @46341 @MDM
  Scenario: Verify that API returns 400  BAD request error code (Send Wrong Body)
    Given path '/api/GetAllCPTCodesFromCPTCodesList'
    * def getAllCPTCodesFromCPTCodesListPassingWrongObjectRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTGetCPTCodesFromCPTCodesListWherePassingWrongInputRequest.json')
    * request getAllCPTCodesFromCPTCodesListPassingWrongObjectRequest
    When method POST
    Then status 400
    * print response

  @46342 @MDM
  Scenario: Verify that API returns 404 Page Not found when we pass wrong URL
    Given path '/api/GetAllCPTCodesFromCPTCodeList'
    * request getAllCPTCodesFromCPTCodesListRequest
    When method POST
    Then status 404
    * print response