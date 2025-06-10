*** Settings ***
Resource        ../src/resources/pages/menu_page.robot
Resource        ../src/resources/common.robot
Resource        ../src/resources/pages/cart_page.robot
Library         SeleniumLibrary
Test Setup      Open Browser To Menu Page
Test Teardown   Teardown Browser



*** Test Cases ***

Delete one item by tapping x button

    Add Espresso to cart

    Add Americano to cart

    Go to Card Page

    Delete Few Elements

