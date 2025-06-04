*** Settings ***
Resource        ../src/resources/common.robot

*** Test Cases ***
Verify Item Addition And Price Calculation
    [Documentation]    TC1: Add items to cart and verify prices
    Open Browser To Menu Page

    Add Coffee To Cart    Espresso
    Add Coffee To Cart    Cappuccino
    Add Coffee To Cart    Flat White

    Open Cart Page

    Increase Item Quantity    2
    Increase Item Quantity    3
    Increase Item Quantity    4

    Verify Cart Contains Item  3   Espresso    2    $10.00    $20.00
    Verify Cart Contains Item  2   Cappuccino    2    $19.00    $38.00
    Verify Cart Contains Item  4   Flat White    2    $18.00    $36.00

    Verify Total Price    $94.00  # 20 + 38 + 36
    [Teardown]    Teardown Browser

*** Keywords ***
Add Coffee To Cart
    [Arguments]    ${coffee_type}
    Click Element    css=[data-test="${coffee_type.replace(" ", "_")}"]

Open Cart Page
    Click Element    xpath = //a[@aria-label="Cart page" and contains(@href, "/cart")]

Increase Item Quantity
    [Arguments]    ${item}

    Click Element    xpath = //*[@id="app"]/div[2]/div/ul/li[${item}]/div[2]/div/button[1]

Verify Cart Contains Item
    [Arguments]   ${item}   ${item_name}    ${quantity}    ${unit_price}    ${total_price}
    Element Should Contain    xpath = //*[@id="app"]/div[2]/div/ul/li[${item}]/div[1]    ${item_name}
    Element Should Contain    xpath = //*[@id="app"]/div[2]/div/ul/li[${item}]/div[2]/span    ${unit_price} x ${quantity}
    Element Should Contain    xpath = //*[@id="app"]/div[2]/div/ul/li[${item}]/div[3]   ${total_price}


Verify Total Price
    [Arguments]    ${expected_price}
    ${total_text} =    Get Text    xpath = //*[@id="app"]/div[2]/div/div[1]/button
    Should Contain    ${total_text}    ${expected_price}