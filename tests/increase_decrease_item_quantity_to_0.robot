*** Settings ***
Resource        ../src/resources/pages/menu_page.robot
Resource        ../src/resources/pages/cart_page.robot
Resource        ../src/resources/common.robot
Library         SeleniumLibrary
Test Setup      Open Browser To Menu Page
Test Teardown   Teardown Browser

*** Variables ***
${ESPRESSO_LINK_XPATH}         //*[@id="app"]/div[2]/ul/li[1]/div/div/div[1]


*** Test Cases ***

Delete one item by tapping x button

    Add Item to cart    ${ESPRESSO_LINK_XPATH}

    Go to Card Page

    Increase Quantity Of Item

    Decrease Quantity Of Item
