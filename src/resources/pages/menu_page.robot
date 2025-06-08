*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${CART_PAGE_LINK_XPATH}        //a[@aria-label="Cart page"]
#${ESPRESSO_ITEM_XPATH}      //a[@aria-label="Espresso"]
${ESPRESSO_ITEM_CSS}     css:div[data-test="Espresso"]
#${quantity_xpath}        ${quantity_xpath}    Set Variable    //li[@class='list-item'][.//div[text()='${item_name}']]//span[@class='unit-desc']
#${PLUS_BUTTON_IN_THE_CART_XPATH}      //li[@class='list-item']//div[@class='unit-controller']//button[@aria-label='Add one Espresso']
${PLUS_BUTTON_IN_THE_CART_XPATH}      //li[.//div[text()='Espresso']]//button[contains(@aria-label, 'Add one Espresso')]
${MINUS_BUTTON_IN_THE_CART_XPATH}      //li[.//div[text()='Espresso']]//button[contains(@aria-label, 'Remove one Espresso')]
${EMPTY_CART_XPATH}      //div[@class='list']/p[normalize-space()='No coffee, go add some.']
${CART_URL}              https://coffee-cart.app/cart



*** Keywords ***
Go to Cart Page
    Wait Until Element Is Visible    ${CART_PAGE_LINK_XPATH}    timeout=10s
    Click Element    ${CART_PAGE_LINK_XPATH}

Verify Cart Contains
    [Arguments]     ${item}     ${quantity}   ${price}
#    Wait Until Page Contains Element    //div[contains(@class,'list-item') and contains(.,'${item}')]    timeout=10s
#    Wait Until Page Contains Element    //li[contains(@class, 'list-item')]//div[text()='Espresso']    timeout=10s
#   працює=======================
    Wait Until Page Contains Element    //li[contains(@class, 'list-item') and .//div[text()='${item}']]   timeout=10s
#   працює ======================
    Element Should Contain    //li[@class='list-item'][.//div[text()='${item}']]//span[@class='unit-desc']  ${quantity}


Select Espresso
    Mouse Over    ${ESPRESSO_ITEM_CSS}
    Wait Until Element Is Visible    ${ESPRESSO_ITEM_CSS}    timeout=10s
    Click Element    ${ESPRESSO_ITEM_CSS}

Add extra (+) Item to the cart
    Mouse Over    ${PLUS_BUTTON_IN_THE_CART_XPATH}
    Wait Until Element Is Visible    ${PLUS_BUTTON_IN_THE_CART_XPATH}    timeout=10s
    Click Element   ${PLUS_BUTTON_IN_THE_CART_XPATH}


Remove (-) one Item from the cart
    Mouse Over    ${MINUS_BUTTON_IN_THE_CART_XPATH}
    Wait Until Element Is Visible    ${MINUS_BUTTON_IN_THE_CART_XPATH}    timeout=10s
    Click Element   ${MINUS_BUTTON_IN_THE_CART_XPATH}
    
    
Verify Empty Cart
    Wait Until Page Contains Element  ${EMPTY_CART_XPATH}       timeout=10
    Element Text Should Be    ${EMPTY_CART_XPATH}    No coffee, go add some.


Reload Cart Page
    Reload Page

