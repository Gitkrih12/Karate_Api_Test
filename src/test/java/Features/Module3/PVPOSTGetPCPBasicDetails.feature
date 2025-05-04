Feature: POST PCP Basic Details

Background:
Given url pvBaseUrl

@39675
Scenario: Verify GetPCP Basic details API is able to  display all PCP details
Given path '/api/GetAllPCPBasicDetails'
* def pcpBasicDetailsRequestBody = read('classpath:Payloads/PVAPIs/PVPOSTPCPBasicDetails.json')
* request pcpBasicDetailsRequestBody
When method POST
Then status 200
* print response

@39709
Scenario: Verify that API return 404Not Found error code (Send Wrong end Point)
Given path '/api/Provider/GetProviderDetail'
* def pcpBasicDetailsRequestBody = read('classpath:Payloads/PVAPIs/PVPOSTPCPBasicDetails.json')
* request pcpBasicDetailsRequestBody
When method POST
Then status 404
* print response

@39708 @PV
Scenario: Verify by Providing the Wrong TokenKey as "CAPVVALOZ"
Given path '/api/GetAllPCPBasicDetails'
* def pcpBasicDetailsWrongTokenRequestBody = read('classpath:Payloads/PVAPIs/PVPOSTPCPBasicDetailsPassingWrongToken.json')
* request pcpBasicDetailsWrongTokenRequestBody
When method POST
Then status 500
* print response

@39707 @PV
Scenario: Verify by Providing the blank  UniqueProviderId
Given path '/api/GetAllPCPBasicDetails'
* def pcpBasicDetailsWithoutPassingUPIDRequestBody = read('classpath:Payloads/PVAPIs/PVPOSTPCPBasicDetailswithoutPassingUPId.json')
* request pcpBasicDetailsWithoutPassingUPIDRequestBody
When method POST
Then status 200
* print response

@39706 @PV
Scenario: Verify the Unique ProviderId which is not present in DB.
Given path '/api/GetAllPCPBasicDetails'
* def pcpBasicDetailsPassingInvalidUPIDRequestBody = read('classpath:Payloads/PVAPIs/PVPOSTPCPBasicDetailsbyPassingInvalidUPId.json')
* request pcpBasicDetailsPassingInvalidUPIDRequestBody
When method POST
Then status 200
* print response