Feature: Sample test Go

  Background:
    Given url reqResUrl
    * call read('classpath:Commons/Commons.feature')
    * def randomEmail = randomString(10)
    * print randomEmail
    * def testData = read("classpath:Payloads/Gorest/GoRestUserDetails.json")
    * testData.email = randomEmail + "@gmail.com"
#    * def testData1 = read("classpath:Payloads/Gorest/GoRestUpdateRequest.json")

  @test
  Scenario: Display the user details
    Given path '/public/v2/users'
    Given header Authorization = "Bearer 147da812c7d7e2ef5f6b55f91937ea0fdfd3f63c359a1abc99f1eb1a619e54f7"
    Given request testData
    When method post
    Then status 201
    * print response
    * def userId = response.id
    * print userId

#    Put request
    Given path '/public/v2/users/' + userId
    Given header Authorization = "Bearer 147da812c7d7e2ef5f6b55f91937ea0fdfd3f63c359a1abc99f1eb1a619e54f7"
    Given request testData
    When method put
    Then status 200
    * print response

  #Delete request
    Given path '/public/v2/users/' + userId
    Given header Authorization = "Bearer 147da812c7d7e2ef5f6b55f91937ea0fdfd3f63c359a1abc99f1eb1a619e54f7"
    When method delete
    Then status 204
    * print response

#  @test
#  Scenario: Display the user details
#    Given path '/public/v2/users'
#    Given header Authorization = "Bearer 147da812c7d7e2ef5f6b55f91937ea0fdfd3f63c359a1abc99f1eb1a619e54f7"
#    Given request testData
##    Given param TokenKey= 'CAMDMVALOR'
#    When method post
#    Then status 201
#    * print response
#    * def userId = response.id
#    * print userId
#
#  @test
#  Scenario: retrieve the user details
#    Given path 'public, 'v2', 'users', userId
#    Given header Authorization = "Bearer 147da812c7d7e2ef5f6b55f91937ea0fdfd3f63c359a1abc99f1eb1a619e54f7"
#    #Given request testData
##    Given param TokenKey= 'CAMDMVALOR'
#    When method get
#    Then status 200
#    * print response