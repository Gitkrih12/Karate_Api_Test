Feature: Get States Details API

  Background:
    Given url mdmBaseUrl

  @44876 @MDM
  Scenario: Verify that user is able to get all Get AllStatesBySearchString
    Given path '/api/GetStatesDetails'
    Given param TokenKey = 'CAMDMVALOR'
    Given param StateName = 'Florida'
    When method get
    Then status 200
    * print response

  @44877 @MDM
  Scenario: Verify that user is able to get all States By Search String New Mexico
    Given path '/api/GetStatesDetails'
    Given param TokenKey = 'CAMDMVALOR'
    Given param StateName = 'NewMexico'
    When method get
    Then status 200
    * print response

  @44878 @MDM
  Scenario: Verify that user able to get States Details even passing Wrong Token Key without Passing Search String
    Given path '/api/GetStatesDetails'
    Given param TokenKey = 'CAMDMVALOZ'
    When method get
    Then status 200
    * print response

  @44893 @MDM
  Scenario: Verify that user Get All States By Search string WA should give state Name consisting WA
    Given path '/api/GetStatesDetails'
    Given param TokenKey = 'CAMDMVALOR'
    Given param StateName = 'WA'
    When method get
    Then status 200
    * print response