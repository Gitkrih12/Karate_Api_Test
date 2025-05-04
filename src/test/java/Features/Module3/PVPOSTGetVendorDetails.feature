Feature: POST Get Vendor Details API

  Background:
    Given url pvBaseUrl
    * def getVendorDetailsRequestBody = read('classpath:Payloads/PVAPIs/PVPOSTGetVendorDetails.json')

  @49481 @PV
  Scenario: Verify that user is able to Get Vendor Details
    Given path '/api/GetVendorDetails'
    * request getVendorDetailsRequestBody
    When method POST
    Then status 200
    * print response

  @49483 @PV
  Scenario: Verify that API returns 404 Not Found (By passing wrong URL)
    Given path '/api/GetVendorDetail'
    * request getVendorDetailsRequestBody
    When method POST
    Then status 404
    * print response

  @49485 @PV
  Scenario: Verify that API returns 400  BAD request error code (Send without Token Key)
    Given path '/api/GetVendorDetails'
    * def getVendorDetailWithoutTokenRequestBody = read('classpath:Payloads/PVAPIs/PVPOSTGetVendorDetailswithoutPassingTokenKey.json')
    * request getVendorDetailWithoutTokenRequestBody
    When method POST
    Then status 400
    * print response

  @49484 @PV
  Scenario: Verify that API retuns 500 internal Server Error (By passing wrong token key)
    Given path '/api/GetVendorDetails'
    * def getVendorDetailWrongTokenRequestBody = read('classpath:Payloads/PVAPIs/PVPOSTGetVendorDetailsWherePassingWrongTokenKey.json')
    * request getVendorDetailWrongTokenRequestBody
    When method POST
    Then status 500
    * print response