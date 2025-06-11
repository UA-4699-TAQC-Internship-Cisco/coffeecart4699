*** Settings ***
Resource        ../src/resources/pages/menu_page.robot
Resource        ../src/resources/common.robot
Resource        ../src/resources/pages/cart_page.robot
Library         SeleniumLibrary
Test Setup      Open Browser To Menu Page
Test Teardown   Teardown Browser

*** Variables ***

${selector}=    xpath://*[@id="app"]/div[2]/p
${text}=    No coffee, go add some.


*** Test Cases ***

Verify Text For Empty Cart

    Go to Card Page

    Verify Text     ${selector}        ${text}
