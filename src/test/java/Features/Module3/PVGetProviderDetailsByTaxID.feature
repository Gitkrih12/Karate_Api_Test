Feature: Get Provider Details API

  Background:
    Given url pvBaseUrl

  @39811 @PV
  Scenario: Verify Provider Details by TaxId with Valid PV API
    Given path '/api/GetProviderDetailsByTaxId'
    Given param TokenKey = 'CAPVVALOR'
    Given param Taxid = "113670755"
    When method get
    Then status 200
    * print response

  @39812 @PV
  Scenario: Verify Provider Details by TaxId with Invalid PV API URL without tokenKey
    Given path '/api/GetProviderDetailsByTaxId'
#    Given param TokenKey = 'CAPVVALOR'
    Given param Taxid = "113670755"
    When method get
    Then status 400
    * print response
    * match response.errors.TokenKey[0] contains "'Token Key' must not be empty."

  @39813 @PV
  Scenario: Verify Provider Details by Different TaxId with Valid PV API
    Given path '/api/GetProviderDetailsByTaxId'
    Given param TokenKey = 'CAPVVALOR'
    Given param Taxid = "6625153"
    When method get
    Then status 200
    * print response

  @39814 @PV
  Scenario: Verify Provider Details with Valid PV API without Key Value
    Given path '/api/GetProviderDetailsByTaxId'
    Given param TokenKey = 'CAPVVALOR'
#    Given param Taxid = "6625153"
    When method get
    Then status 400
    * print response



