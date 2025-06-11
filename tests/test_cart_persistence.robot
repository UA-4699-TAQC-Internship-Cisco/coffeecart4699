*** Settings ***
Resource    ../src/resources/common.robot
Resource    ../src/resources/pages/menu_page.robot

Test Teardown   Teardown Browser

*** Test Cases ***
Verify That Cart Items Persist After Page Reload
    Open Browser To Menu Page
    Click On Coffee By Name    Espresso
    Go to Card Page
    Reload Page
    Cart Icon Should Show Items    Espresso    1
