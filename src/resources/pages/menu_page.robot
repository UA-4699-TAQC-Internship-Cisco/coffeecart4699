*** Settings ***
Library         SeleniumLibrary
Library         Collections
Library    ../../scripts/CartPreview.py


*** Variables ***
${CART_PAGE_LINK_XPATH}        //a[@aria-label="Cart page"]
${ESPRESSO_LINK_XPATH}         //*[@id="app"]/div[2]/ul/li[1]/div/div/div[1]
${AMERICANO_LINK_XPATH}        //*[@id="app"]/div[2]/ul/li[6]/div/div/div[1]


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



