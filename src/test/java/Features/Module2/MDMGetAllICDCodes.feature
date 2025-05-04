Feature: Get All ICD Codes API

  Background:
    Given url mdmBaseUrl

  @46836 @MDM
  Scenario: Verify user able to Get All ICD Codes by using Valid CA MDM API with Mandate Key
    Given path '/api/GetAllICDCodes'
    Given param TokenKey = 'CAMDMVALOR'
    Given param Version = 'ICD10'
    When method get
    Then status 200
    * print response

  @46837 @MDM
  Scenario: Verify user able to Get All ICD Codes by using Valid CA MDM API without Mandate Key
    Given path '/api/GetAllICDCodes'
    Given param TokenKey = 'CAMDMVALOR'
    When method get
    Then status 400
    * print response


  @46838 @MDM
  Scenario: Verify user able to Get All ICD Codes by using Invalid CA MDM API without Token Key
    Given path '/api/GetAllICDCodes'
    Given param Version = 'ICD10'
    When method get
    Then status 200
    * print response

  @46839 @MDM
  Scenario: Verify user able to Get All ICD Codes by using Invalid CA MDM API URL
    Given path '/api/GetAllICDCode'
    Given param TokenKey = 'CAMDMVALOR'
    Given param Version = 'ICD10'
    When method get
    Then status 404
    * print response