*** Settings ***
Library         SeleniumLibrary
Library         Collections

*** Variables ***
${CART_PAGE_LINK_XPATH}        //a[@aria-label="Cart page"]
${ESPRESSO_LINK_XPATH}         //*[@id="app"]/div[2]/ul/li[1]/div/div/div[1]
${AMERICANO_LINK_XPATH}        //*[@id="app"]/div[2]/ul/li[6]/div/div/div[1]
${DIALOG_ADD_TO_CART_CSS}   css:#app > dialog

*** Keywords ***
Go to Card Page
    Wait Until Element Is Visible    ${CART_PAGE_LINK_XPATH}
    Click Link    ${CART_PAGE_LINK_XPATH}

Add Espresso to cart
    Click Element      ${ESPRESSO_LINK_XPATH}

Add Americano to cart
    Click Element      ${AMERICANO_LINK_XPATH}

Verify Items Count
    [Arguments]  ${exp_count}
    ${count}=    Get Items Count
    Should Be Equal    ${count}    ${exp_count}

Verify Items
    [Arguments]    ${list_items}    ${EXPECTED_LIST}
    Lists Should Be Equal    ${list_items}    ${EXPECTED_LIST}

Click Items
    Wait Until Element Is Visible    ${ESPRESSO_LINK_XPATH}     timeout=10s
    Click Element   ${ESPRESSO_LINK_XPATH}

Click On Coffee By Name
    [Arguments]    ${drink_name}
    ${xpath}=    Set Variable    //div[@data-test="${drink_name}"]
    Click Element    xpath=${xpath}

Right Click On Coffee By Name
    [Arguments]    ${drink_name}
    ${xpath}=    Set Variable    //div[@data-test="${drink_name}"]
    Open Context Menu    xpath=${xpath}

Verify Add To Cart Dialog Appears
    Wait Until Element Is Visible    ${DIALOG_ADD_TO_CART_CSS}    ${IMPLICIT_WAIT}

Cart Icon Should Show Items
    [Arguments]    ${drink_name}    ${expected_quantity}
    Wait Until Element Is Visible    xpath=//*[@id="app"]/div[2]    ${IMPLICIT_WAIT}
    ${item_text}=    Get Text    xpath=//*[@id="app"]/div[2]/div/ul/li[2]
    Should Contain    ${item_text}    ${drink_name}
    Should Contain    ${item_text}    ${expected_quantity}
