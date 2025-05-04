Feature: POST Get DefaultPayTo Details API

  Background:
    Given url pvBaseUrl
    * def getDefaultPayToDetails = read("classpath:Payloads/PVAPIs/PVPOSTGetDefaultPayToDetails-"+karate.env+".json")

  @39796 @PV
  Scenario: Verify Provider Default PayTo details with Valid PV API
    Given path '/api/DefaultPayToDetails'
    * request getDefaultPayToDetails
    When method POST
    Then status 200
    * print response

  @39797 @PV
  Scenario: Verify Provider Default PayTo details with Invalid PV API URL
    Given path '/api/DefaultPayToDetailse'
#    * def getDefaultPayToRequestBody = read('classpath:Payloads/PVPOSTGetDefaultPayToDetails.json')
    * request getDefaultPayToDetails
    When method POST
    Then status 404
    * print response

  @39798 @PV
  Scenario: Verify Provider Default PayTo details with Invalid PV API without TokenKey
    Given path '/api/DefaultPayToDetails'
    * def getDefaultPayToWithoutTokenRequestBody = read('classpath:Payloads/PVAPIs/PVPOSTGetDefaultPayToDetailswithoutTokenKey.json')
    * request getDefaultPayToWithoutTokenRequestBody
    When method POST
    Then status 400
    * print response

  @39801 @PV
  Scenario: Verify Provider Default PayTo details with Invalid PV API request body
    Given path '/api/DefaultPayToDetails'
    * def getDefaultPayToWrongObjectRequestBody = read('classpath:Payloads/PVAPIs/PVPOSTGetDefaultPayToDetailswithWrongRequestObject.json')
    * request getDefaultPayToWrongObjectRequestBody
    When method POST
    Then status 400
    * print response


  @39803 @PV
  Scenario: Verify Provider Default PayTo details with Valid PV API with out Key Value
    Given path '/api/DefaultPayToDetails'
    * def getDefaultPayToWithoutKeyValueRequestBody = read('classpath:Payloads/PVAPIs/PVPOSTGetDefaultPayToDetailswithWrongRequestObjectwithoutUPId.json')
    * request getDefaultPayToWithoutKeyValueRequestBody
    When method POST
    Then status 400
    * print response