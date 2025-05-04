Feature: Get Places Details API

  Background:
    Given url mdmBaseUrl

  @44945 @MDM
  Scenario: Verify user able to Get All Place of Services by using Valid CA MDM API Value By Hospital Name
    Given path '/api/GetPlacesDetails'
    Given param TokenKey = 'CAMDMVALOR'
    Given param Name = 'Hospital'
    When method get
    Then status 200
    * print response

  @44946 @MDM
  Scenario: Verify user able to Get All Place of Services by using Valid CA MDM API without Passing any Params
    Given path '/api/GetPlacesDetails'
    When method get
    Then status 400
    * print response
    * match response.errors.TokenKey[0] contains "'Token Key' must not be empty."

  @44947 @MDM
  Scenario: Verify user able to Get All Place of Services by using Invalid CA MDM API URL
    Given path '/api/GetPlaceDetails'
    Given param TokenKey = 'CAMDMVALOR'
    Given param Name = 'Hospital'
    When method get
    Then status 404
    * print response

  @44950 @MDM
  Scenario: Verify user able to Get Specific Places of Services by using Valid CA MDM API as Sort by Service Hospital Value
    Given path '/api/GetPlacesDetails'
    Given param TokenKey = 'CAMDMVALOR'
    Given param Name = 'Off Campus-Outpatient Hospital'
    Given param MDMCode = 'POS00000011'
    When method get
    Then status 200
    * print response

  @44951 @MDM
  Scenario: Verify user able to Get All Place of Services by using Valid CA MDM API Value without Passing Mandate Field
    Given path '/api/GetPlacesDetails'
    Given param TokenKey = 'CAMDMVALOR'
    Given param MDMCode = 'POS00000011'
    When method get
    Then status 200
    * print response

  @44952 @MDM
  Scenario: Verify user able to Get All Place of Services by using Valid CA MDM API with Different Value
    Given path '/api/GetPlacesDetails'
    Given param TokenKey = 'CAMDMVALOR'
    Given param Name = 'Clinic'
    When method get
    Then status 200
    * print response