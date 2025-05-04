Feature: Get All Genders Details API

  Background:
    Given url mdmBaseUrl


  @44836 @MDM
  Scenario: Verify that user is able to get all Gender Details
    Given path '/api/GetGenderDetails'
    Given param TokenKey = 'CAMDMVALOR'
    When method get
    Then status 200
    * print response

  @44838 @MDM
  Scenario: Verify that API returns 500 internal Server Error (By passing wrong token key)
    Given path '/api/GetGenderDetails'
    Given param TokenKey = 'CAMDMVALOZ'
    When method get
    Then status 200
    * print response