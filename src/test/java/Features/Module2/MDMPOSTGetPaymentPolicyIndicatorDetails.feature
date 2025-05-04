Feature: Get Payment Policy Indicator Details API

  Background:
    Given url mdmBaseUrl

  @62054 @MDM
  Scenario: Verify user able to Get Payment Policy Indicator Details using Valid CPT and DOS
    Given path '/api/GetPaymentPolicyIndicatorDetails'
    * def getPaymentPolicyIndicatorDetailsRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTGetPaymentPolicyIndicatorDetails.json')
    * request getPaymentPolicyIndicatorDetailsRequest
    When method POST
    Then status 200
    * print response

  @62055 @MDM
  Scenario: Verify user able to Get Payment Policy Indicator Details using Valid CPT and DOS where increasing Number of Valid Objects
    Given path '/api/GetPaymentPolicyIndicatorDetails'
    * def getPaymentPolicyIndicatorDetailsIncreasingRecordsCountRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTGetPaymentPolicyIndicatorDetailsIncreasingRecordsCount.json')
    * request getPaymentPolicyIndicatorDetailsIncreasingRecordsCountRequest
    When method POST
    Then status 200
    * print response

  @62056 @MDM
  Scenario: Verify user able to Get Payment Policy Indicator Details using Valid CPT and DOS without Passing TokenKey
    Given path '/api/GetPaymentPolicyIndicatorDetails'
    * def getPaymentPolicyIndicatorDetailsWithoutPassingTokenKeyRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTGetPaymentPolicyIndicatorDetailsWithoutPassingTokenKey.json')
    * request getPaymentPolicyIndicatorDetailsWithoutPassingTokenKeyRequest
    When method POST
    Then status 400
    * print response
    * match response.errors.TokenKey[0] contains "'Token Key' must not be empty."

  @62057 @MDM
  Scenario: Verify user able to Get Payment Policy Indicator Details By Passing one Object Valid and another Object Invalid
    Given path '/api/GetPaymentPolicyIndicatorDetails'
    * def getPaymentPolicyIndicatorDetailsWherePassingOtherObjectRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTGetPaymentPolicyIndicatorDetailsWherePassingInvalidAPIData.json')
    * request getPaymentPolicyIndicatorDetailsWherePassingOtherObjectRequest
    When method POST
    Then status 200
    * print response