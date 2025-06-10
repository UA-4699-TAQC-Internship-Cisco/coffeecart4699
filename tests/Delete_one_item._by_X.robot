*** Settings ***
Resource        ../src/resources/pages/menu_page.robot
Resource        ../src/resources/common.robot
Library         SeleniumLibrary
Test Setup      Open Browser To Menu Page
Test Teardown   Teardown Browser

*** Variables ***
${DELETE_BUTTON}    xpath://*[@id="app"]/div[2]/div/ul/li[2]/div[4]/button
${ESPRESSO_LINK_XPATH}         //*[@id="app"]/div[2]/ul/li[1]/div/div/div[1]

*** Test Cases ***

Delete one item by tapping x button

    Add Item to cart    ${ESPRESSO_LINK_XPATH}

    Go to Card Page

    Click Element   ${DELETE_BUTTON}

