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

${DIALOG_ADD_TO_CART_CSS}   css:#app > dialog
${TOTAL_BUTTON_XPATH}        //*[@id="app"]/div[2]/div[1]/button
${POP_UP_MENU_XPATH}        //*[@id="app"]/div[2]/div[1]/ul/li
${POP_UP_MENU_ITEMS_XPATH}        //*[@id="app"]/div[2]/div[1]/ul


*** Keywords ***
Go to Card Page
    Wait Until Element Is Visible    ${CART_PAGE_LINK_XPATH}
    Click Link    ${CART_PAGE_LINK_XPATH}

Add Item to cart
    [Arguments]  ${locator}
    Click Element       ${locator}

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

Cart Icon Should Show Count
    [Arguments]    ${expected_count}
    ${text}=    Get Text    xpath=//a[contains(@aria-label, "Cart page")]
    Log    Cart icon text: ${text}
    Should Contain    ${text}    (${expected_count})

Promotional Dialog Should Appear
    Wait Until Element Is Visible    xpath=//div[contains(@class, "promo")]    ${IMPLICIT_WAIT}

Click Promotional Dialog Button Yes
    Click Button    css:div.promo button.yes

Click Promotional Dialog Button No
    Click Button    xpath=//div[contains(@class, "promo")]//button[normalize-space(text())="Nah, I'll skip."]

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
