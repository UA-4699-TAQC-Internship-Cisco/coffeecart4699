*** Settings ***
Resource        ../src/resources/pages/menu_page.robot
Resource        ../src/resources/common.robot
Library         SeleniumLibrary
Test Setup      Open Browser To Menu Page
Test Teardown   Teardown Browser


*** Test Cases ***
Add items and check pop up menu
    Add Americano to cart
    Add Cafe Latte to cart
    Open Pop Up Menu
    Check IS Item In Cart   Americano x 1
    Check IS Item In Cart   Cafe Latte x 1
    Check Items Count         2


