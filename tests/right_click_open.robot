*** Settings ***
Resource    ../src/resources/common.robot

*** Test Cases ***
Verify That Right-Clicking On A Coffee Icon Opens The "Add To Cart" Dialog
    Open Browser To Menu Page
    Right Click On Coffee Icon
    Verify Add To Cart Dialog Appears
    Teardown Browser

*** Keywords ***
Right Click On Coffee Icon
    Right Click Element    css:div[data-test="Espresso"]


Verify Add To Cart Dialog Appears
    Wait Until Element Is Visible    css:#app > dialog    10s
