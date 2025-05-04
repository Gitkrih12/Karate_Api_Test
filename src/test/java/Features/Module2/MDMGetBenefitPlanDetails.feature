Feature: Get All BenefitPlan Details API

  Background:
    Given url mdmBaseUrl


  @58549 @MDM
  Scenario: Verify user able to Get Benefit Plan Details of Particular Member by using Valid CA MDM API Data
    Given path '/api/GetBenefitPlanDetails'
    Given param TokenKey = 'CAMDMVALOR'
    Given param product_id = '001'
    Given param plan_name = 'ARKSS'
    Given param Plan_Effective_End_Date = '2020-12-31'
    When method get
    Then status 200
    * print response
#    * match response.errors.TokenKey[0] contains "'Token Key' must not be empty."

  @58550 @MDM
  Scenario: Verify user able to Get Benefit Plan Details of Particular Member by using Valid CA MDM API Data where leaving some params
    Given path '/api/GetBenefitPlanDetails'
    Given param TokenKey = 'CAMDMVALOR'
    Given param product_id = '001'
    Given param plan_name = 'ARKSS'
    When method get
    Then status 400
    * print response
    * match response.errors.Plan_Effective_End_Date[0] contains "'Plan_ Effective_ End_ Date' must not be empty."

  @58551 @MDM
  Scenario: Verify user able to Get Benefit Plan Details of Particular Member by using Invalid CA MDM API Data without passing Token Key
    Given path '/api/GetBenefitPlanDetails'
    Given param product_id = '001'
    Given param plan_name = 'ARKSS'
    Given param Plan_Effective_End_Date = '2020-12-31'
    When method get
    Then status 400
    * print response
    * match response.errors.TokenKey[0] contains "'Token Key' must not be empty."

  @58552 @MDM
  Scenario: Verify user able to Get Benefit Plan Details of Particular Member by using Invalid CA MDM API Data
    Given path '/api/GetBenefitplanDetail'
    Given param TokenKey = 'CAMDMVALOR'
    Given param product_id = '001'
    Given param plan_name = 'ARKSS'
    Given param Plan_Effective_End_Date = '2020-12-31'
    When method get
    Then status 404
    * print response