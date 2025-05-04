Feature: Get Vendor By Unique VendorId Or TaxId API

  Background:
    Given url pvBaseUrl
    * def testData = read("classpath:karate-"+env+".json")

  @39541 @PV
  Scenario: Verify Vendor details by VendorUniqueIdOrTaxId with Valid PV Get VendorInfo API
    Given path '/api/GetVendorByUniqueVendorIdOrTaxId'
    Given param TokenKey = 'CAPVVALOR'
    Given param UniqueVendorId = testData[1].GetVendorByUniqueVendorIdOrTaxIdOrPayToIdUniqueVendorId
    Given param Taxid = testData[1].GetVendorByUniqueVendorIdOrTaxIdOrPayToIdTaxid
    When method get
    Then status 200
    * print response

  @39542 @PV
  Scenario: Verify Vendor details by tokenkey with Valid PV Get VendorInfo API
    Given path '/api/GetVendorByUniqueVendorIdOrTaxId'
    Given param TokenKey = 'CAPVVALOR'
#    Given param UniqueVendorId = testData[1].GetVendorByUniqueVendorIdOrTaxIdOrPayToIdUniqueVendorId
#    Given param Taxid = testData[1].GetVendorByUniqueVendorIdOrTaxIdOrPayToIdTaxid
    When method get
    Then status 200
    * print response

  @39543 @PV
  Scenario: Verify Vendor details by TaxId with Valid PV Get VendorInfo API
    Given path '/api/GetVendorByUniqueVendorIdOrTaxId'
    Given param TokenKey = 'CAPVVALOR'
#    Given param UniqueVendorId = testData[1].GetVendorByUniqueVendorIdOrTaxIdOrPayToIdUniqueVendorId
    Given param Taxid = testData[1].GetVendorByUniqueVendorIdOrTaxIdOrPayToIdTaxid
    When method get
    Then status 200
    * print response

  @39544 @PV
  Scenario: Verify Vendor details by VendorUniqueId with Valid PV Get VendorInfo API
    Given path '/api/GetVendorByUniqueVendorIdOrTaxId'
    Given param TokenKey = 'CAPVVALOR'
    Given param UniqueVendorId = testData[1].GetVendorByUniqueVendorIdOrTaxIdOrPayToIdUniqueVendorId
#    Given param Taxid = testData[0].GetVendorByUniqueVendorIdOrTaxIdOrPayToIdTaxid
    When method get
    Then status 200
    * print response

  @39545 @PV
  Scenario: Verify Vendor details by VendorUniqueIdOrTaxId with wrong PV Get VendorInfo API URL
    Given path '/api/GetVendorByUniqueVendorIdsOrTaxId'
    Given param TokenKey = 'CAPVVALOR'
    Given param UniqueVendorId = testData[1].GetVendorByUniqueVendorIdOrTaxIdOrPayToIdUniqueVendorId
    Given param Taxid = testData[1].GetVendorByUniqueVendorIdOrTaxIdOrPayToIdTaxid
    When method get
    Then status 404
    * print response

  @39546 @PV
  Scenario: Verify Vendor details by VendorUniqueIdOrTaxId with Invalid PV Get VendorInfo API
    Given path '/api/GetVendorByUniqueVendorIdOrTaxId'
#    Given param TokenKey = 'CAPVVALOR'
    Given param UniqueVendorId = testData[1].GetVendorByUniqueVendorIdOrTaxIdOrPayToIdUniqueVendorId
    Given param Taxid = testData[1].GetVendorByUniqueVendorIdOrTaxIdOrPayToIdTaxid
    When method get
    Then status 400
    * print response
    * match response.errors.TokenKey[0] contains "'Token Key' must not be empty."