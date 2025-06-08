*** Settings ***
Library         SeleniumLibrary
Library         Collections
Library         ../src/scripts/CartPreview.py

*** Variables ***
${CART_PAGE_LINK_XPATH}        //a[@aria-label="Cart page"]


*** Keywords ***
Go to Card Page
    Wait Until Element Is Visible    ${CART_PAGE_LINK_XPATH}
    Click Link    ${CART_PAGE_LINK_XPATH}

Verify Items Count
    [Arguments]  ${exp_count}
    ${count}=    Get Items Count
    Should Be Equal    ${count}    ${exp_count}

Verify Items
    [Arguments]    ${list_items}    ${EXPECTED_LIST}
    Lists Should Be Equal    ${list_items}    ${EXPECTED_LIST}

Click Items
    Click Element    css:div[data-test="Espresso"]
