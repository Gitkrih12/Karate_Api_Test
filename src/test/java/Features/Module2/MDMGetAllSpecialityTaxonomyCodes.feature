Feature: Get All Speciality Taxonomy Codes API

  Background:
    Given url mdmBaseUrl

  @44987 @MDM
  Scenario: Verify user able to Get Speciality Taxonomy Code by using Valid CA MDM API with Taxonomy Code
    Given path '/api/GetSpecialityTaxonomyCodes'
    Given param TokenKey = 'CAMDMVALOR'
    Given param TaxonomyCode = '101Y00000X'
    When method get
    Then status 200
    * print response

  @44988 @MDM
  Scenario: Verify user able to Get Speciality Taxonomy Code by using Valid CA MDM API without Key Values
    Given path '/api/GetSpecialityTaxonomyCodes'
    Given param TokenKey = 'CAMDMVALOR'
    When method get
    Then status 200
    * print response

  @44989 @MDM
  Scenario: Verify user able to Get Speciality Taxonomy Code by using Invalid CA MDM API with wrong URL
    Given path '/api/GetSpecialityTaxonomyCode'
    Given param TokenKey = 'CAMDMVALOR'
    Given param TaxonomyCode = '101Y00000X'
    When method get
    Then status 404
    * print response

  @44990 @MDM
  Scenario: Verify user able to Get Speciality Taxonomy Code by using Invalid CA MDM API without Token Key
    Given path '/api/GetSpecialityTaxonomyCodes'
    Given param TaxonomyCode = '101Y00000X'
    When method get
    Then status 400
    * print response
    * match response.errors.TokenKey[0] contains "'Token Key' must not be empty."