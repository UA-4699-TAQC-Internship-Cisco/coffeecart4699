*** Settings ***
Resource        ../src/resources/pages/menu_page.robot
Resource        ../src/resources/common.robot
Resource        ../src/resources/pages/cart_page.robot
Library         SeleniumLibrary
Test Setup      Open Browser To Menu Page
Test Teardown   Teardown Browser

*** Variables ***
${DELETE_BUTTON}    xpath://*[@id="app"]/div[2]/div/ul/li[2]/div[4]/button


*** Test Cases ***

Delete one item by tapping x button

    Add Espresso to cart

    Add Americano to cart

    Go to Card Page

    Click Element   ${DELETE_BUTTON}

    ${cart_text}=    Get Text    xpath://*[@id="app"]/ul/li[2]/a


    Should Be Equal As Strings    ${cart_text}    cart (1)

