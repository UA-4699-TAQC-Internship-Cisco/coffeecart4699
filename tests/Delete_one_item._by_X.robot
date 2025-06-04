*** Settings ***
Resource        ../src/resources/pages/menu_page.robot
Resource        ../src/resources/common.robot
Library         SeleniumLibrary
Test Setup      Open Browser To Menu Page
Test Teardown   Teardown Browser

*** Variables ***
${DELETE_BUTTON}    xpath://*[@id="app"]/div[2]/div/ul/li[2]/div[4]/button

*** Test Cases ***

Delete one item by tapping x button

    Add Espresso to cart
    sleep   1
    Go to Card Page
    sleep   1
    Click Element   ${DELETE_BUTTON}
    sleep   1
