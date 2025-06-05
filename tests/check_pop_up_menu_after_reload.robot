*** Settings ***
Resource        ../src/resources/pages/menu_page.robot
Library         SeleniumLibrary


*** Variables ***
${BROWSER}          Chrome
${URL}              https://coffee-cart.app/


*** Test Cases ***
Check pop up menu after reload
    Open Browser         ${URL}             ${BROWSER}             executable_path=/var/www/intern_softserve/coffeecart4699/chromedriver
    Click Element    xpath=//*[@id="app"]/div[2]/ul/li[6]/div/div/div[1]
    Reload Page
    Mouse Over    xpath=//*[@id="app"]/div[2]/div[1]/button
    Set Selenium Implicit Wait  10
    Wait Until Element Is Visible    xpath=//*[@id="app"]/div[2]/div[1]/ul/li
    ${item_list}=    Get Text    xpath=//*[@id="app"]/div[2]/div[1]/ul/li
    Should Contain    ${item_list}    Americano x 1
    Close Browser

