*** Settings ***
Resource        ../src/resources/pages/menu_page.robot
Resource        ../src/resources/common.robot
Library         SeleniumLibrary
Test Setup      Open Browser To Menu Page
Test Teardown   Teardown Browser


*** Test Cases ***
Check pop up menu after reload
    Add Americano to cart
    Reload Page
    Open Pop Up Menu
    Check Items Count         1
    Check IS Item In Cart   Americano x 1


