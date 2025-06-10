*** Settings ***
Resource        ../src/resources/pages/menu_page.robot
Library         SeleniumLibrary


*** Variables ***

${BROWSER}      Chrome
${URL}          https://coffee-cart.app/
${Empty_COUNT}  0
@{EXPECTED_LIST}  Espresso



*** Test Cases ***

Open
    Open Browser         ${URL}             ${BROWSER}
    Go to Card Page
#    Go to Card Page
    Verify Items Count    ${Empty_COUNT}
    Click Items
    Click Items
    ${list_items}    Get Pay Coffe List
    Verify Items    ${list_items}    ${EXPECTED_LIST}
    Close Browser