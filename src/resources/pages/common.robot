*** Settings ***
Library    SeleniumLibrary
Library    Process
Library    Collections

*** Variables ***
${BROWSER}    Chrome
${URL}        https://coffee-cart.app/
${TIMEOUT}          15 seconds
${DELAY}            0.5

*** Keywords ***
Open Browser To Menu Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    

Teardown Browser
    Close Browser

Ignore Requirements Error
    Run Keyword And Ignore Error    File Should Not Exist    requirements.txt
