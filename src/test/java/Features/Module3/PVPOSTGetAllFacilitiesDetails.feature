Feature: POST Get All Facilities Details API

  Background:
    Given url pvBaseUrl
    * def getAllFacilitiesValid = read("classpath:Payloads/PVAPIs/PVPOSTGetAllFacilities-"+karate.env+".json")

  @39758 @PV
  Scenario: Verify that user is able to get all facilities Details with Search criteria
    Given path '/api/GetAllFacilities'
    * request getAllFacilitiesValid
    When method POST
    Then status 200
    * print response

  @39759 @PV
  Scenario: Verify that if search Criteria is not matching it Displays blank Response for get all facilities API
    Given path '/api/GetAllFacilities'
    * def getAllFacilitiesRequestBody = read('classpath:Payloads/PVAPIs/PVPOSTGetAllFacilitieswithpassingEmptyFieldValues.json')
    * request getAllFacilitiesRequestBody
    When method POST
    Then status 200
    * print response

  @39760 @PV
  Scenario: Verify that API returns 500 internal Server Error (By passing wrong token key)
    Given path '/api/GetAllFacilities'
    * def getAllFacilitiesWrongRequestBody = read('classpath:Payloads/PVAPIs/PVPOSTGetAllFacilitieswithPassingWrongToken.json')
    * request getAllFacilitiesWrongRequestBody
    When method POST
    Then status 500
    * print response

  @39761 @PV
  Scenario: Verify that API returns 400  BAD request error code (request sending without Passing TokenKey)
    Given path '/api/GetAllFacilities'
    * def getAllFacilitiesWithoutTokenRequestBody = read('classpath:Payloads/PVAPIs/PVPOSTGetAllFacilitiesWithoutPassingTokenKey.json')
    * request getAllFacilitiesWithoutTokenRequestBody
    When method POST
    Then status 400
    * print response