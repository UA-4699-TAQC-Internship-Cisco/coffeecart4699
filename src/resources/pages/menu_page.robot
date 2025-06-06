*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${CART_PAGE_LINK_XPATH}       //a[@aria-label="Cart page"]
${POPUP_PROMO_WINDOW}         //*[@id="app"]/div[2]
${ESPRESSO_CUP}               //div[@aria-label="Espresso"]
${CAPUCCINO_CUP}              //div[@aria-label="Cappuccino"]
${CONFIRM_EXTRA_CUP}          //*[@id="app"]/div[2]/div[2]/button[1]
${FLAT_WHITE_CUP}             //div[@aria-label="Flat White"]
${AMERICANO_CUP}              //*[@id="app"]/div[2]/ul/li[6]/div/div/div[1]
${CAFE_LATTE_CUP}             //div[@aria-label="Cafe Latte"]
${ESPRESSO_MACCHIATO_CUP}     //div[@aria-label="Espresso Macchiato"]

*** Keywords ***
Go to Card Page
    Wait Until Element Is Visible    ${CART_PAGE_LINK_XPATH}
    Click Link    ${CART_PAGE_LINK_XPATH}

Add Six Different Items
    Click Element                     ${ESPRESSO_CUP}
    Click Element                     ${CAPUCCINO_CUP}
    Click Element                     ${FLAT_WHITE_CUP}
    Wait Until Element Is Visible     ${POPUP_PROMO_WINDOW}
    Click Element                     ${CONFIRM_EXTRA_CUP}
    Click Element                    ${AMERICANO_CUP}
    Click Element                     ${CAFE_LATTE_CUP}
    Set Selenium Implicit Wait        10 seconds
    