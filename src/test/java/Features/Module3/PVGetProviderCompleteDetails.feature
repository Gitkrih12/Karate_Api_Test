Feature: Get Provider Complete Details API

  Background:
    Given url pvBaseUrl

  @39457 @PV
  Scenario: Verify ProviderCompleteDetails with Valid PV Get Complete details API
    Given path '/api/GetProviderCompleteDetails'
    Given param TokenKey = 'CAPVVALOR'
    Given param UniqueProviderId = "PRO000006770"
    Given param Npinumber = "1598336828"
    When method get
    Then status 200
    * print response

  @39458 @PV
  Scenario: Verify ProviderCompleteDetails with Invalid PV Get Complete details API URL
    Given path '/api/GetProvidersCompleteDetails'
    Given param TokenKey = 'CAPVVALOR'
    Given param UniqueProviderId = "PRO000006770"
    Given param Npinumber = "1598336828"
    When method get
    Then status 404
    * print response

  @39459 @PV
  Scenario: Verify ProviderCompleteDetails with Valid PV Get Complete details API URL without token key
    Given path '/api/GetProviderCompleteDetails'
    Given param TokenKey = 'CAPVLOR'
    Given param UniqueProviderId = "PRO000006770"
    Given param Npinumber = "1598336828"
    When method get
    Then status 500
    * print response

  @39460 @PV
  Scenario: Verify ProviderCompleteDetails with Valid PV Get Complete details API without passing ProviderId
    Given path '/api/GetProviderCompleteDetails'
    Given param TokenKey = 'CAPVVALOR'
#    Given param UniqueProviderId = "PRO000006770"
    Given param Npinumber = "1598336828"
    When method get
    Then status 200
    * print response

  @39461 @PV
  Scenario: Verify ProviderCompleteDetails with Invalid PV Get Complete details API with out passing npinumber
    Given path '/api/GetProviderCompleteDetails'
    Given param TokenKey = 'CAPVVALOR'
    Given param UniqueProviderId = "PRO000006770"
#    Given param Npinumber = "1598336828"
    When method get
    Then status 200
    * print response