*** Settings ***
Library         SeleniumLibrary

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


