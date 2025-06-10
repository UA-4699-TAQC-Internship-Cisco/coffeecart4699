*** Settings ***
Resource        ../src/resources/pages/menu_page.robot
Resource        ../src/variables.resource
Library         SeleniumLibrary


*** Variables ***
${Empty_COUNT}  0
@{EXPECTED_LIST}  Espresso



*** Test Cases ***

Open
    Open Browser         ${URL}             ${BROWSER}
#    Go to Card Page
    Maximize Browser Window
    Verify Items Count    ${Empty_COUNT}
    Click Items
    Click Items
    Open Context Menu    //div[@data-test="Espresso"]
    ${list_items}    Get Pay Coffe List
    Verify Items    ${list_items}    ${EXPECTED_LIST}
    Close Browser