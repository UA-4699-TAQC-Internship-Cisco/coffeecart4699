*** Settings ***
Resource        ../src/resources/pages/menu_page.robot
Resource        ../src/resources/common.robot

Resource        ../src/resources/pages/cart_page.robot
Library         SeleniumLibrary
Test Setup      Open Browser To Menu Page
Test Teardown   Teardown Browser

*** Variables ***

${ESPRESSO_LINK_XPATH}         //*[@id="app"]/div[2]/ul/li[1]/div/div/div[1]
${AMERICANO_LINK_XPATH}        //*[@id="app"]/div[2]/ul/li[6]/div/div/div[1]

*** Test Cases ***

Delete one item by tapping x button

    Add Item to cart    ${ESPRESSO_LINK_XPATH}

    Add Item to cart    ${AMERICANO_LINK_XPATH}

    Go to Card Page

    Delete Few Elements

