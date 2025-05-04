Feature: Get Cities Details API

  Background:
    Given url mdmBaseUrl
    * def testData = read("classpath:karate-"+karate.env+".json")

  @44954 @MDM
  Scenario: Verify user able to Get All Cities by SearchString using Valid CA MDM API Value
    Given path '/api/GetCitiesDetails'
    Given param TokenKey = 'CAMDMVALOR'
    Given param CityName = testData[2].GetCitiesDetailsCityName
    When method get
    Then status 200
    * print response

  @44956 @MDM
  Scenario: Verify user able to Get All Cities by SearchString using Invalid CA MDM API URL
    Given path '/api/GetCitiesDetail'
    Given param TokenKey = 'CAMDMVALOR'
    Given param CityName = testData[2].GetCitiesDetailsCityName
    When method get
    Then status 404
    * print response

  @44957 @MDM
  Scenario: Verify user able to Get All Cities by SearchString using Valid CA MDM API Passing wrong Value for Mandate field
    Given path '/api/GetCitiesDetails'
    Given param TokenKey = 'CAMDMVALOR'
    Given param CityName = 'Hyderabad'
    When method get
    Then status 200
    * print response

  @44958 @MDM
  Scenario: Verify user able to Get All Cities by using Valid CA MDM API without Passing any Params
    Given path '/api/GetCitiesDetails'
    When method get
    Then status 400
    * print response
    * match response.errors.TokenKey[0] contains "'Token Key' must not be empty."

  @44959 @MDM
  Scenario: Verify user able to Get All Service Providing Cities by using Valid CA MDM API without Passing Mandate Field
    Given path '/api/GetCitiesDetails'
    Given param TokenKey = 'CAMDMVALOR'
    Given param CityName = testData[2].GetCitiesDetailsCityName
    When method get
    Then status 200
    * print response