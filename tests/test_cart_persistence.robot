*** Settings ***
Resource    ../src/resources/common.robot

*** Test Cases ***
Verify That Cart Items Persist After Page Reload
    Open Browser To Menu Page
    Add Coffee To Cart
    Get Cart Item Count
    Reload Page
    Cart Icon Should Show Items
    Open Cart
    Cart Should Contain Coffee Item
    Teardown Browser

*** Keywords ***
Add Coffee To Cart
    Click Element    css:div[data-test="Espresso"]

Get Cart Item Count
    ${text}=    Get Text    xpath=//a[contains(@aria-label, 'Cart page')]
    ${count_str}=    Evaluate    ${text}.split('(')[1].split(')')[0]
    ${count}=    Convert To Integer    ${count_str}
    [Return]    ${count}

Cart Icon Should Show Items
    Wait Until Element Contains    css:#app > ul > li:nth-child(2) > a    1    5s
    ${count}=    Get Text    css:#app > ul > li:nth-child(2) > a
    Should Be True    ${count} >= 1

Reload Page
    Reload Page

Open Cart
    Click Element    css:.cart-icon

Cart Should Contain Coffee Item
    Wait Until Element Is Visible    css:.cart-item    10s
    Element Should Contain    css:.cart-item    Espresso
