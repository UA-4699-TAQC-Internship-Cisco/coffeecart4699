*** Settings ***
Resource    ../src/resources/common.robot

*** Test Cases ***
Verify That Cart Items Persist After Page Reload
    Open Browser To Menu Page
    Add Coffee To Cart
    Open Cart
    Reload Current Page
    Cart Icon Should Show Items
    Teardown Browser

*** Keywords ***
Add Coffee To Cart
    Click Element    css:div[data-test="Espresso"]

Open Cart
    Click Element    xpath = //a[@aria-label="Cart page" and contains(@href, "/cart")]

Reload Current Page
    Reload Page

Cart Icon Should Show Items
    Wait Until Element Is Visible    xpath=//*[@id="app"]/div[2]    10s
    ${item_text}=    Get Text    xpath=//*[@id="app"]/div[2]/div/ul/li[2]
    Should Contain    ${item_text}    Espresso
    Should Contain    ${item_text}    1
