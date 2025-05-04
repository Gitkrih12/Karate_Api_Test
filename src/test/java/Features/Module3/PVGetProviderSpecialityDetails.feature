Feature: Get Provider Speciality Details API

  Background:
    Given url pvBaseUrl

  @59684 @PV
  Scenario: Verify user able to Get_Provider Speciality Details by UniqueProviderId with Valid PV API
    Given path '/api/GetProviderSpecialityDetails'
    Given param TokenKey = 'CAPVVALOR'
    Given param UniqueProviderId = 'PRO000011272'
    When method get
    Then status 200
    * print response

  @59685 @PV
  Scenario: Verify user able to Get_Provider Speciality Details with Valid PV API Data without Passing any Additional Params
    Given path '/api/GetProviderSpecialityDetails'
    Given param TokenKey = 'CAPVVALOR'
    When method get
    Then status 200
    * print response

  @59686 @PV
  Scenario: Verify user able to Get_Provider Speciality Details by UniqueProviderId with Invalid PV API
    Given path '/api/GetProviderSpecialityDetail'
    Given param TokenKey = 'CAPVVALOR'
    Given param UniqueProviderId = 'PRO000011272'
    When method get
    Then status 404
    * print response

  @59687 @PV
  Scenario: Verify user able to Get_Provider Speciality Details by UniqueProviderId with Valid PV API with out Token Key
    Given path '/api/GetProviderSpecialityDetails'
#    Given param TokenKey = 'CAPVVALOR'
    Given param UniqueProviderId = 'PRO000011272'
    When method get
    Then status 400
    * print response
    * match response.errors.TokenKey[0] contains "'Token Key' must not be empty."