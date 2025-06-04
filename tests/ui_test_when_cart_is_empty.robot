*** Settings ***
Resource        ../src/resources/pages/menu_page.robot
Resource        ../src/resources/common.robot
Library         SeleniumLibrary
Test Setup      Open Browser To Menu Page
Test Teardown   Teardown Browser

*** Variables ***
${TEXT_XPATH}=    Get Text    xpath://*[@id="app"]/div[2]/p

*** Test Cases ***

Delete one item by tapping x button


    Go to Card Page
    sleep   1
    Should Be Equal As Strings    ${TEXT_XPATH}    "No coffee, go add some."
    sleep   1