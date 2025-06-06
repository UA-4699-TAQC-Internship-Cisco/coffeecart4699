*** Settings ***
Resource        ../src/resources/pages/menu_page.robot
Library         SeleniumLibrary

*** Variables ***
${BROWSER}               Chrome
${URL}                  https://coffee-cart.app/

*** Test Cases ***
Double Click Coffee Title
    Open Browser                 ${URL}             ${BROWSER}
    Double Click Element         ${CAPPUCCINO_TITLE}
    Set Selenium Implicit Wait        10 seconds
    Close Browser