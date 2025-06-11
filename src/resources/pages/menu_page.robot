*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${CART_PAGE_LINK_XPATH}       //a[@aria-label="Cart page"]
${CAPPUCCINO_TITLE}           //*[@id="app"]/div[2]/ul/li[3]/h4
*** Keywords ***
Go to Card Page
    Wait Until Element Is Visible    ${CART_PAGE_LINK_XPATH}
    Click Link    ${CART_PAGE_LINK_XPATH}