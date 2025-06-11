*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${CART_PAGE_LINK_XPATH}        //a[@aria-label="Cart page"]
${PRODUCT_CARD_XPATH}          //*[@id="app"]/div[2]/ul/li[1]/div/div/div[1]
${TOTAL_BUTTON_XPATH}          //*[@id="app"]/div[2]/div[1]/button
${CART_PREVIEW_XPATH}          //ul[contains(@class, 'cart-preview')]
${CART_ITEM_XPATH}             //ul[contains(@class, 'cart-preview')]/li[contains(@class, 'list-item')]
${UNIT_DESC_XPATH}             //span[contains(@class, 'unit-desc') and contains(text(), 'x')]
${PROCEED_BUTTON_XPATH}        //button[@aria-label="Proceed to checkout"]

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
