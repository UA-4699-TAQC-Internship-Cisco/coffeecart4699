*** Settings ***
Library         SeleniumLibrary
Library         Collections
Library         ../src/scripts/CartPreview.py

*** Variables ***
${CART_PAGE_LINK_XPATH}        //a[@aria-label="Cart page"]
${ESPRESSO_LINK_XPATH}         //*[@id="app"]/div[2]/ul/li[1]/div/div/div[1]
${AMERICANO_LINK_XPATH}        //*[@id="app"]/div[2]/ul/li[6]/div/div/div[1]
${CAFE_LATE_LINK_XPATH}        //*[@id="app"]/div[2]/ul/li[7]/div/div
${TOTAL_BUTTON_XPATH}        //*[@id="app"]/div[2]/div[1]/button
${POP_UP_MENU_XPATH}        //*[@id="app"]/div[2]/div[1]/ul/li
${POP_UP_MENU_ITEMS_XPATH}        //*[@id="app"]/div[2]/div[1]/ul


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

Add Cafe Latte to cart
    Click Element   ${CAFE_LATE_LINK_XPATH}

Open Pop Up Menu
    Mouse Over    ${TOTAL_BUTTON_XPATH}
    Wait Until Element Is Visible    ${POP_UP_MENU_XPATH}

Check IS Item In Cart
    [Arguments]    ${exp_item_with_number}
    ${item_list}=    Get Text    ${POP_UP_MENU_ITEMS_XPATH}
    Should Contain    ${item_list}    ${exp_item_with_number}

Check Items Count
    [Arguments]  ${exp_count}
    ${count}=    Get Element Count      ${POP_UP_MENU_XPATH}
    Should Be Equal As Integers    ${count}    ${exp_count}
