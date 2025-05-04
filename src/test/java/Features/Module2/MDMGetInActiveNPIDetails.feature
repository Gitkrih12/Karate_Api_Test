Feature: Get All InActive NPI Details API

  Background:
    Given url mdmBaseUrl

  @62111 @MDM
  Scenario: Verify user able to Get InActive NPI Details using Valid MDM API Data
    Given path '/api/GetInActive_NPIDetails'
    Given param TokenKey = 'MDMGENERIC'
    When method get
    Then status 200
    * print response

  @62112 @MDM
  Scenario: Verify user able to Get InActive NPI Details using Valid MDM API Data Try to Pass Parameters
    Given path '/api/GetInActive_NPIDetails'
    Given param TokenKey = 'MDMGENERIC'
    Given param NPI = '1043439706'
    When method get
    Then status 200
    * print response

  @62113 @MDM
  Scenario: Verify user able to Get InActive NPI Details using InValid MDM API Data with wrong URL
    Given path '/api/GetInActive_NPIDetail'
    Given param TokenKey = 'MDMGENERIC'
    When method get
    Then status 404
    * print response

  @62114 @MDM
  Scenario: Verify user able to Get InActive NPI Details using Valid MDM API Data Without Passing Token Key Parameter
    Given path '/api/GetInActive_NPIDetails'
    When method get
    Then status 400
    * print response