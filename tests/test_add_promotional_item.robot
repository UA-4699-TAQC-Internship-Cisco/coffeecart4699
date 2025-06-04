*** Settings ***
Resource    ../src/resources/common.robot

*** Test Cases ***
Add Promotional Item
    Open Browser To Menu Page
    Add Coffee Item To Cart    Espresso     # 1
    Cart Icon Should Show Count    1
    Add Coffee Item To Cart    Espresso_Macchiato     # 2
    Cart Icon Should Show Count    2
    Add Coffee Item To Cart    Cappuccino     # 3
    Promotional Dialog Should Appear
    Click Promotional Dialog Button Yes
    Cart Icon Should Show Count    4
    Add Coffee Item To Cart    Espresso     # 5
    Cart Icon Should Show Count    5
    Add Coffee Item To Cart    Espresso_Macchiato     # 6
    Promotional Dialog Should Appear
    Click Promotional Dialog Button No
    Cart Icon Should Show Count    6
    Add Coffee Item To Cart    Cappuccino     # 7
    Cart Icon Should Show Count    7
    Add Coffee Item To Cart    Espresso     # 8
    Cart Icon Should Show Count    8
    Add Coffee Item To Cart    Espresso_Macchiato     # 9
    Promotional Dialog Should Appear
    Click Another Coffee Item During Dialog    Cappuccino
    Cart Icon Should Show Count    10
    Teardown Browser

*** Keywords ***
Add Coffee Item To Cart
    [Arguments]    ${item_name}
    Click Element    xpath=//div[contains(@data-test, "${item_name}")]

Cart Icon Should Show Count
    [Arguments]    ${expected_count}
    ${text}=    Get Text    xpath=//a[contains(@aria-label, "Cart page")]
    Log    Cart icon text: ${text}
    Should Contain    ${text}    (${expected_count})

Promotional Dialog Should Appear
    Wait Until Element Is Visible    xpath=//div[contains(@class, "promo")]    10s

Click Promotional Dialog Button Yes
    Click Button    css:div.promo button.yes

Click Promotional Dialog Button No
    Click Button    xpath=//div[contains(@class, "promo")]//button[normalize-space(text())="Nah, I'll skip."]

Click Another Coffee Item During Dialog
    [Arguments]    ${item_name}
    Click Element    xpath=//div[contains(@data-test, "${item_name}")]
