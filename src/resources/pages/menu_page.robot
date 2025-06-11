*** Settings ***
Library         SeleniumLibrary
Library         Collections

*** Variables ***
${CART_PAGE_LINK_XPATH}        //a[@aria-label="Cart page"]
${PRODUCT_CARD_XPATH}          //*[@id="app"]/div[2]/ul/li[1]/div/div/div[1]
${TOTAL_BUTTON_XPATH}          //*[@id="app"]/div[2]/div[1]/button
${CART_PREVIEW_XPATH}          //ul[contains(@class, 'cart-preview')]
${CART_ITEM_XPATH}             //ul[contains(@class, 'cart-preview')]/li[contains(@class, 'list-item')]
${UNIT_DESC_XPATH}             //span[contains(@class, 'unit-desc') and contains(text(), 'x')]
${PROCEED_BUTTON_XPATH}        //button[@aria-label="Proceed to checkout"]
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

Ensure Product Is Visible
    Page Should Contain Element    ${PRODUCT_CARD_XPATH}

Click Coffee Icon To Add Item
    Click Element    ${PRODUCT_CARD_XPATH}

Wait For Total Button To Update
    Wait Until Element Contains    ${TOTAL_BUTTON_XPATH}    Total: $    5s

Open Cart Preview
    Mouse Over    ${TOTAL_BUTTON_XPATH}
    Sleep         1s

Verify Cart Preview Content
    Wait Until Page Contains Element    ${CART_PREVIEW_XPATH}    5s
    Page Should Contain Element         ${CART_ITEM_XPATH}
    Page Should Contain Element         ${UNIT_DESC_XPATH}
    Page Should Contain Element         ${PROCEED_BUTTON_XPATH}

Capture Cart Screenshot
    Capture Element Screenshot     ${CART_PREVIEW_XPATH}

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

Add First Item To Cart
    Click Element    ${PRODUCT_CARD_XPATH}

Open Payment Form
    Click Element    ${TOTAL_BUTTON_XPATH}

Fill Payment Details
    Input Text    xpath=//input[@name="name"]     John Doe
    Input Text    xpath=//input[@name="email"]    test@mail.com

Submit Order
    Click Button    xpath=//button[text()="Submit"]

Verify Confirmation Snackbar
    Wait Until Page Contains Element    xpath=//div[contains(@class, 'snackbar') and contains(text(), 'Thanks for your purchase')]    10s

Verify Cart Is Empty
    Wait Until Element Contains    ${TOTAL_BUTTON_XPATH}    $0.00    10s

Verify Modal Is Hidden
    Wait Until Keyword Succeeds    10x    1s    Element Attribute Value Should Be    xpath=//div[contains(@class, "modal")]    style    display: none;

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

