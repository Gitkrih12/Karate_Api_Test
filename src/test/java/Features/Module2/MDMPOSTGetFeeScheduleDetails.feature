Feature: Get Fee Schedule Details API

  Background:
    Given url mdmBaseUrl
    * def getFeeScheduleDetailsRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTGetFeeScheduleDetailsValid.json')


  @67540 @MDM
  Scenario: Verify user able to Get Fee Schedule Details using Valid MDM API Request
    Given path '/api/GetFeeScheduleDetails'
    * request getFeeScheduleDetailsRequest
    When method POST
    Then status 200
    * print response

  @67541 @MDM
  Scenario: Verify user able to Get Fee Schedule Details using Valid MDM API Request By Passing Different CPT Codes
    Given path '/api/GetFeeScheduleDetails'
    * def getFeeScheduleDetailsWherePassingDifferentDetailsRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTGetFeeScheduleDetailsValidPassingDifferentValues.json')
    * request getFeeScheduleDetailsWherePassingDifferentDetailsRequest
    When method POST
    Then status 200
    * print response

  @67542 @MDM
  Scenario: Verify user able to Get Fee Schedule Details using Valid MDM API Request By Passing one Invalid CPT
    Given path '/api/GetFeeScheduleDetails'
    * def getFeeScheduleDetailsPassingOneInvalidCPTRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTGetFeeScheduleDetailsPassingOneInvalidCPT.json')
    * request getFeeScheduleDetailsPassingOneInvalidCPTRequest
    When method POST
    Then status 200
    * print response

  @67543 @MDM
  Scenario: Verify user able to Get Fee Schedule Details using Valid MDM API Request with out Passing Token Key
    Given path '/api/GetFeeScheduleDetails'
    * def getFeeScheduleDetailsWithoutPassingTokenKeyRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTGetFeeScheduleDetailsWithoutPassingTokenKey.json')
    * request getFeeScheduleDetailsWithoutPassingTokenKeyRequest
    When method POST
    Then status 400
    * print response
    * match response.errors.TokenKey[0] contains "'Token Key' must not be empty."

  @67549 @MDM
  Scenario: Verify user able to Get Fee Schedule Details using Invalid MDM API Request with wrong URL
    Given path '/api/GetFeeScheduleDetail'
    * request getFeeScheduleDetailsRequest
    When method POST
    Then status 404
    * print response