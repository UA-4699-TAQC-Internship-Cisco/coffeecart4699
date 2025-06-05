*** Settings ***
Resource        ../src/resources/pages/menu_page.robot
Library         SeleniumLibrary

*** Variables ***
${BROWSER}               Chrome
${URL}                  https://coffee-cart.app/

*** Test Cases ***
Proceed Payment When Cart Is Empty
    Open Browser                 ${URL}    ${BROWSER}
    Click Element                ${TOTAL_BUTTON}
    Proceed Payment
    Set Selenium Implicit Wait    10 seconds
    Close Browser