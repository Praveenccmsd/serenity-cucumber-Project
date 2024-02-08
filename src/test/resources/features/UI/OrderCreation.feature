
@tag
@Franchisee
  Scenario: The user needs to open the Cross Broader application.
    Given User logs in to client portal using "CB_FranchiseeUser"

  @Franchisee @AU_PriceLimit
  Scenario Outline: : The Franchisee trys to create international order of walk-in customer
    Given User navigates to below modules
      | Orders |
    And User need to click the ordersid "XBF17067920852" hyperlink
    And User need to click "Edit"
    And The user needs to set the below value for the respective dropdown for consignee
      | Country *     | <Consignee country>    |
      | Mobile Code * | <Consignee mobilecode> |
    And The user needs to set the below value for the respective dropdown
      | Currency Code * | <currencycode> |
    And User needs to add the below product details for their current order
      | Product | SKU | QUANTITY | UNIT PRICE | HSN CODE |
      | Laptop  | KJU |        1 |      47250 |   909090 |
    And User click on the "Confirm" button
    #And The user needs to wait for the loading process of the application to finish 2
    Then System giving an alert message like "Order edited successfully"
    And User click on the "Ship" button
    And User click on the "Deferred Service" button
    And The user needs to set the below radio button values for "Deferred Service"
      | GAC ( ₹ 236 ) |
    #And The user needs to wait for the loading process of the application to finish 1
    And User need to click on prompt "Ship" button
    Then System giving an alert message like "Total order price should be less than 900.0 AUD for deferred service type."
    And User click on the "Close" button
