Feature: Get All HIPPS Codes API

  Background:
    Given url mdmBaseUrl

  @53662 @MDM
  Scenario: Verify that user is able to GetAllHIPPSCodes
    Given path '/api/GetAllHIPPSCode'
    Given param TokenKey = 'CAMDMVALOR'
    Given param IncludedInactive = 'true'
    When method get
    Then status 200
    * print response

  @53664 @MDM
  Scenario: Verify that API retuns 404 Not Found (By passing wrong URL)
    Given path '/api/GetAllHIPPS1Code'
    Given param TokenKey = 'CAMDMVALOR'
    Given param IncludedInactive = 'true'
    When method get
    Then status 404
    * print response

  @53666 @MDM
  Scenario: Verify that API returns 400 Bad Request by without passing Token Key
    Given path '/api/GetAllHIPPSCode'
    Given param IncludedInactive = 'true'
    When method get
    Then status 400
    * print response

  @53671 @MDM
  Scenario: Verify user able to get All HIPPS Codes response where Passing false for 'IncludedInactive' field
    Given path '/api/GetAllHIPPSCode'
    Given param TokenKey = 'CAMDMVALOR'
    Given param IncludedInactive = 'false'
    When method get
    Then status 200
    * print response