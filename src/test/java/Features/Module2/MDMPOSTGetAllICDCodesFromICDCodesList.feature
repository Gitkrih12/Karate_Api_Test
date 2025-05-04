Feature: Get All ICD Codes From ICD Codes List  API

  Background:
    Given url mdmBaseUrl
    * def getAllICDCodesFromICDCodesListRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTGetAllICDCodesFromICDCodesListRequest.json')

  @60505 @MDM
  Scenario: Verify user able to Get All ICD Codes from ICD Codes List Details with Valid MDM API Where passing All Mandate Fields as well as Multiple ICD Codes
    Given path '/api/GetAllICDCodesFromICDCodesListDetails'
    * request getAllICDCodesFromICDCodesListRequest
    When method POST
    Then status 200
    * print response

  @60506 @MDM
  Scenario: Verify user able to Get All ICD Codes from ICD Codes List with Valid MDM API where not passing Mandate fields and also passing few ICD Codes
    Given path '/api/GetAllICDCodesFromICDCodesListDetails'
    * def getAllICDCodesFromICDCodesListWherePassingFewICDCodesRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTGetAllICDCodesFromICDCodesListWherePassingFewICDCods.json')
    * request getAllICDCodesFromICDCodesListWherePassingFewICDCodesRequest
    When method POST
    Then status 200
    * print response

  @60507 @MDM
  Scenario: Verify user able to Get All ICD Codes from ICD Codes List with Invalid MDM API other Version Code
    Given path '/api/GetAllICDCodesFromICDCodesListDetails'
    * def getAllICDCodesFromICDCodesListWithDifferentVersionRequest = read('classpath:Payloads/MDMAPIs/MDMPOSTGetAllICDCodesFromICDCodesListWithDifferentVersionRequest.json')
    * request getAllICDCodesFromICDCodesListWithDifferentVersionRequest
    When method POST
    Then status 200
    * print response

  @60508 @MDM
  Scenario: Verify user able to Get All ICD Codes from ICD Codes List with Invalid MDM API URL
    Given path '/api/GetAllICDCodesFromICDCodesListDetail'
    * request getAllICDCodesFromICDCodesListRequest
    When method POST
    Then status 404
    * print response