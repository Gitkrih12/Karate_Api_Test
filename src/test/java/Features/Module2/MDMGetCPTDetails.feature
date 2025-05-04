Feature: Get CPT Details API

  Background:
    Given url mdmBaseUrl
    * def testData = read("classpath:karate-"+karate.env+".json")

  @36576 @MDM
  Scenario: Verify CPT Details with Valid MDM API Value
    Given path '/api/GetCPTDetail'
    Given param TokenKey = 'CAMDMVALOR'
    Given param cptCode = testData[2].GetCPTDetailsCptCode
    When method get
    Then status 200
    * print response

  @36577 @MDM
  Scenario: Verify CPT Details with Invalid MDM API data with Empty CPT code
    Given path '/api/GetCPTDetail'
    Given param TokenKey = 'CAMDMVALOR'
#    Given param cptCode = "0001U"
    When method get
    Then status 200
    * print response

  @36578 @MDM
  Scenario: Verify CPT Details with Invalid MDM API data
    Given path '/api/CPTDetails/GetCPTDetail'
    Given param TokenKey = 'CAMDMVALOR'
    Given param cptCode = testData[2].GetCPTDetailsCptCode
    When method get
    Then status 404
    * print response