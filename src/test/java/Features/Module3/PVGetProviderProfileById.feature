Feature: Get Provider Profile API

  Background:
    Given url pvBaseUrl
    * def testData = read("classpath:karate-"+karate.env+".json")

  @39816 @39819 @PV
  Scenario: Verify Provider Profile by ContractIdOrTaxIdOrProviderId with Valid PV API
    Given path '/api/GetProviderProfileById'
    Given param TokenKey = 'CAPVVALOR'
    Given param UniqueProviderId = "PRO000013502"
    Given param profileId = "21687"
    When method get
    Then status 200
    * print response

  @39817 @PV
  Scenario: Verify Provider Profile by ContractIdOrTaxIdOrProviderId with Invalid PV API URL
    Given path '/api/GetProvidersProfileById'
    Given param TokenKey = 'CAPVVALOR'
    Given param UniqueProviderId = "PRO000013502"
    Given param profileId = "21687"
    When method get
    Then status 404
    * print response

  @39818 @PV
  Scenario: Verify Provider Profile by ContractIdOrTaxIdOrProviderId with Invalid PV API without tokenKey
    Given path '/api/GetProviderProfileById'
#    Given param TokenKey = 'CAPVVALOR'
    Given param UniqueProviderId = "PRO000013502"
    Given param profileId = "21687"
    When method get
    Then status 400
    * print response

  @39820 @PV
  Scenario: Verify Provider Profile by ProviderId with Valid PV API
    Given path '/api/GetProviderProfileById'
    Given param TokenKey = 'CAPVVALOR'
#    Given param UniqueProviderId = "PRO000013502"
    Given param profileId = "21687"
    When method get
    Then status 200
    * print response

  @39821 @PV
  Scenario: Verify Provider Profile by ContractIdOrProviderId with Valid PV API
    Given path '/api/GetProviderProfileById'
    Given param TokenKey = 'CAPVVALOR'
    Given param ContractId = "11123"
    Given param profileId = "21687"
    When method get
    Then status 200
    * print response

  @39822 @PV
  Scenario: Verify Provider Profile by TaxIdOrProviderId with Valid PV API
    Given path '/api/GetProviderProfileById'
    Given param TokenKey = 'CAPVVALOR'
    Given param taxId = testData[1].GetVendorByUniqueVendorIdOrTaxIdOrPayToIdTaxid
    Given param profileId = "21687"
    When method get
    Then status 200
    * print response

