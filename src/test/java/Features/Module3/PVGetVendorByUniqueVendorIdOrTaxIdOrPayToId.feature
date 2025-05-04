Feature: Get Vendor By UniqueVendorId Or TaxId Or PayToId

  Background:
    Given url pvBaseUrl
    * def testData = read("classpath:karate-"+karate.env+".json")

  @39450 @PV
  Scenario: Verify Vendor NPI details by VendorUniqueIdOrTaxIdOrPayToId with Valid PV Get VendorInfo API
    Given path '/api/GetVendorByUniqueVendorIdOrTaxId'
    Given param TokenKey = 'CAPVVALOR'
    Given param UniqueVendorId = testData[1].GetVendorByUniqueVendorIdOrTaxIdOrPayToIdUniqueVendorId
    Given param Taxid = testData[1].GetVendorByUniqueVendorIdOrTaxIdOrPayToIdTaxid
    Given param UniquePaytoId = testData[1].GetVendorByUniqueVendorIdOrTaxIdOrPayToIdUniquePaytoId
    When method get
    Then status 200
    * print response

  @39453 @PV
  Scenario: Verify Vendor NPI details by VendorUniqueIdOrPayToId with Valid PV Get VendorInfo API adding UniqueVendorId removed TaxId
    Given path '/api/GetVendorByUniqueVendorIdOrTaxId'
    Given param TokenKey = 'CAPVVALOR'
    Given param UniqueVendorId = testData[1].GetVendorByUniqueVendorIdOrTaxIdOrPayToIdUniqueVendorId
#    Given param Taxid = testData[1].GetVendorByUniqueVendorIdOrTaxIdOrPayToIdTaxid
    Given param UniquePaytoId = testData[1].GetVendorByUniqueVendorIdOrTaxIdOrPayToIdUniquePaytoId
    When method get
    Then status 200
    * print response

  @39454 @PV
  Scenario: Verify Vendor NPI details by TaxId with Valid PV Get VendorInfo API
    Given path '/api/GetVendorByUniqueVendorIdOrTaxId'
    Given param TokenKey = 'CAPVVALOR'
#    Given param UniqueVendorId = testData[1].GetVendorByUniqueVendorIdOrTaxIdOrPayToIdUniqueVendorId
    Given param Taxid = testData[1].GetVendorByUniqueVendorIdOrTaxIdOrPayToIdTaxid
#    Given param UniquePaytoId = testData[1].GetVendorByUniqueVendorIdOrTaxIdOrPayToIdUniquePaytoId
    When method get
    Then status 200
    * print response

  @39455 @PV
  Scenario: Verify Vendor NPI details by UniquePayToId with Valid PV Get VendorInfo API
    Given path '/api/GetVendorByUniqueVendorIdOrTaxId'
    Given param TokenKey = 'CAPVVALOR'
#    Given param UniqueVendorId = testData[1].GetVendorByUniqueVendorIdOrTaxIdOrPayToIdUniqueVendorId
#    Given param Taxid = testData[1].GetVendorByUniqueVendorIdOrTaxIdOrPayToIdTaxid
    Given param UniquePaytoId = testData[1].GetVendorByUniqueVendorIdOrTaxIdOrPayToIdUniquePaytoId
    When method get
    Then status 200
    * print response

  @39451 @PV
  Scenario: Verify Vendor NPI details by VendorUniqueIdOrTaxIdOrPayToId with Invalid PV Get VendorInfo URL without TokenKey
    Given path '/api/GetVendorByUniqueVendorIdOrTaxId'
#    Given param TokenKey = 'CAPVVALOR'
    Given param UniqueVendorId = testData[1].GetVendorByUniqueVendorIdOrTaxIdOrPayToIdUniqueVendorId
    Given param Taxid = testData[1].GetVendorByUniqueVendorIdOrTaxIdOrPayToIdTaxid
    Given param UniquePaytoId = testData[1].GetVendorByUniqueVendorIdOrTaxIdOrPayToIdUniquePaytoId
    When method get
    Then status 400
    * print response
    * match response.errors.TokenKey[0] contains "'Token Key' must not be empty."

  @39452 @PV
  Scenario: Verify Vendor NPI details provide only tokenkey with Valid PV Get VendorInfo API
    Given path '/api/GetVendorByUniqueVendorIdOrTaxId'
    Given param TokenKey = 'CAPVVALOR'
#    Given param UniqueVendorId = testData[1].GetVendorByUniqueVendorIdOrTaxIdOrPayToIdUniqueVendorId
#    Given param Taxid = testData[1].GetVendorByUniqueVendorIdOrTaxIdOrPayToIdTaxid
#    Given param Taxid = testData[1].GetVendorByUniqueVendorIdOrTaxIdOrPayToIdUniquePaytoId
    When method get
    Then status 200
    * print response