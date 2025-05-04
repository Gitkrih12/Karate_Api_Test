Feature: POST Provider Detail

  Background:
    Given url pvBaseUrl
    * def providerDetail = read("classpath:Payloads/PVAPIs/PVPOSTProviderDetail-"+karate.env+".json")

  @36581 @PV
  Scenario: Validate user able to Get Providers ID and NPI with Valid PV API file data
    Given path '/api/GetProviderDetail'
    * request providerDetail
    When method POST
    Then status 200
    * print response

#  @36582 @PV
#  Scenario: Validate user able to Get NPI and Address as well as Facility Name with Valid PV API file data
#  @36583 @PV
#  Scenario: Validate user able to Get Providers Taxonomy and Plan Name as well as Tax ID with Valid PV API file data
#  @36584 @PV
#  Scenario: Validate user able to Get functionalities Sortby, Sort order and Index as well as Limit with Valid PV API file data
#  @36833 @PV
#  Scenario: Verify PV_API_GetProvider details response against Stored Procedures of Database
  @36585 @PV
  Scenario: Validate user able to Get Providers IPACodes and IPAName as well as UniqueContract ID with Valid PV API file data
    Given path '/api/GetProviderDetail'
    * request providerDetail
    When method POST
    Then status 200
    * print response

  @36586 @PV
  Scenario: Verify Providers Info with Invalid Providers NPIandName_PV API file data
    Given path '/api/GetProviderDetail'
    * def providerDetailPassingInvalidParamsRequestBody = read('classpath:Payloads/PVAPIs/PVProviderDetailWithInvalidNPIandName.json')
    * request providerDetailPassingInvalidParamsRequestBody
    When method POST
    Then status 200
    * print response

  @36588 @PV
  Scenario: Verify Providers Info with Invalid Token Key_PV API file data
    Given path '/api/GetProviderDetail'
    * def providerDetailInvalidTokenRequestBody = read('classpath:Payloads/PVAPIs/PVProviderDetailwithInvalidTokenKey.json')
    * request providerDetailInvalidTokenRequestBody
    When method POST
    Then status 500
    * print response

  @36592 @PV
  Scenario: Verify Providers Info with Invalid Providers info file data by Removing NPI from String
    Given path '/api/GetProviderDetail'
    * def providerDetailRemovedNPIFromStringRequestBody = read('classpath:Payloads/PVAPIs/PVProviderDetailRemovedNPIfromRequestObject.json')
    * request providerDetailRemovedNPIFromStringRequestBody
    When method POST
    Then status 200
    * print response