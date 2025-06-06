*** Settings ***
Resource        ../src/resources/pages/menu_page.robot
Library         SeleniumLibrary


*** Variables ***
${BROWSER}          Chrome
${URL}              https://coffee-cart.app/


*** Test Cases ***
Add items and check pop up menu
    Open Browser         ${URL}             ${BROWSER}             executable_path=/var/www/intern_softserve/coffeecart4699/chromedriver
    Click Element    xpath=//*[@id="app"]/div[2]/ul/li[7]/div/div/div[1]
    Click Element    xpath=//*[@id="app"]/div[2]/ul/li[6]/div/div/div[1]
    Mouse Over    xpath=//*[@id="app"]/div[2]/div[1]/button
    Set Selenium Implicit Wait  10
    Wait Until Element Is Visible    xpath=//*[@id="app"]/div[2]/div[1]/ul/li
    ${first_item}=    Get Text    xpath=//*[@id="app"]/div[2]/div[1]/ul/li[1]
    ${second_item}=    Get Text    xpath=//*[@id="app"]/div[2]/div[1]/ul/li[2]
    Should Contain    ${first_item}    Americano x 1
    Should Contain    ${second_item}    Cafe Latte x 1
    Close Browser

