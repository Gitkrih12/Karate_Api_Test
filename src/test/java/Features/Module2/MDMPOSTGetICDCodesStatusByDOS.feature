Feature: Get All ICD Codes Status By DOS  API

  Background:
    Given url mdmBaseUrl
    * def getAllICDCodesStatusByDOSRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTGetICDCodesStatusByDOSRequest.json')


  @51685 @MDM
  Scenario: Verify user able to Get All ICDCodes Status by DOS using Valid CA MDM API Value
    Given path '/api/GetICDCodeStatusByDOS'
    * request getAllICDCodesStatusByDOSRequest
    When method POST
    Then status 200
    * print response

  @51686 @MDM
  Scenario: Verify user able to Get All ICDCodes Status by DOS using Invalid CA MDM API End Point
    Given path '/api/GetICDCodStatusByDOS'
    * request getAllICDCodesStatusByDOSRequest
    When method POST
    Then status 404
    * print response

  @51687 @MDM
  Scenario: Verify user able to Get All ICDCodes Status by DOS using Invalid CA MDM API Request without Mandate Keys
    Given path '/api/GetICDCodeStatusByDOS'
    * def getAllICDCodesStatusByDOSWithoutPassingMandateFieldsRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTGetAllICDCodesStatusByDOSWithoutPassingMandateFieldsRequest.json')
    * request getAllICDCodesStatusByDOSWithoutPassingMandateFieldsRequest
    When method POST
    Then status 200
    * print response

  @51688 @MDM
  Scenario: Verify user able to Get All ICDCodes Status by DOS using Valid CA MDM API Value where removing Some ICD Codes from Given Request
    Given path '/api/GetICDCodeStatusByDOS'
    * def getAllICDCodesStatusByDOSRemovedFewICDCodesRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTGetAllICDCodesStatusByDOSByRemovingSomeICDCodesFromObjectRequest.json')
    * request getAllICDCodesStatusByDOSRemovedFewICDCodesRequest
    When method POST
    Then status 200
    * print response