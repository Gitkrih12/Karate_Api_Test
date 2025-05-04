Feature: POST Contract

  Background:
    Given url pvBaseUrl

  @36593 @PV
  Scenario: Verify Unique Providers ID and NPI Name as well Providers Details with Valid PV Get Contract API data
    Given path '/api/GetContract'
    * def getContractRequestBody = read('classpath:Payloads/PVAPIs/PVPOSTContract.json')
    * request getContractRequestBody
    When method POST
    Then status 200
    * print response

  @36594 @PV
  Scenario: Verify Remit Information and unique1099Id as well Insurance Company Details with Valid PV Get Contract API data
#  @36596 @PV
#  Scenario: Verify Tax ID or SSN and Roster effective Info as well as Contract effective Info with Valid PV Get Contract API data
#  @36597 @PV
#  Scenario: Verify Pay class data and Claim Type as well as Contract Type with Valid PV Get Contract API data
#  @36598 @PV
#  Scenario: Verify isVendor Approved and Contract Status as well as Claim ID info with Valid PV Get Contract API data
#  @36600 @PV
#  Scenario: Verify DOS form Number and taxonomyCode as well as contractName with Valid PV Get Contract API data
#  @36601 @PV
#  Scenario: Verify Default remit Information and refProvider Information as well as Interest rate, Contract ID with Valid PV Get Contract API data
#  @36602 @PV
#  Scenario: Verify Practice Location Info and CPTCodes Data of all Members with Valid PV Get Contract API data
#  @36832 @PV
#  Scenario: Verify PV_API_GetContract details response against Stored Procedures of Database
    Given path '/api/GetContract'
    * def getContractRequestBody = read('classpath:Payloads/PVAPIs/PVPOSTContract.json')
    * request getContractRequestBody
    When method POST
    Then status 200
    * print response

  @36603 @PV
  Scenario: Verify PV Get Contract API data with Invalid PV_API URL
    Given path '/api/GetContra'
    * def getContractInvalidUrlRequestBody = read('classpath:Payloads/PVAPIs/PVPOSTContract.json')
    * request getContractInvalidUrlRequestBody
    When method POST
    Then status 404
    * print response

  @36604 @PV
  Scenario: Verify PV Get Contract API data with Invalid data by Removed Nonmandatory content from String
    Given path '/api/GetContract'
    * def getContractRemovedStringRequestBody = read('classpath:Payloads/PVAPIs/PVPOSTContractRemovedsomeStringfromRequestObject.json')
    * request getContractRemovedStringRequestBody
    When method POST
    Then status 200
    * print response

  @36605 @PV
  Scenario: Verify PV Get Contract API data with Invalid data
    Given path '/api/GetContract'
    * def getContractInvalidObjectRequestBody = read('classpath:Payloads/PVAPIs/PVPOSTContractWithInvalidRequestObject.json')
    * request getContractInvalidObjectRequestBody
    When method POST
    Then status 400
    * print response