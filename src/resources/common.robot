*** Settings ***
Library    SeleniumLibrary
Resource   ./variables.resource

*** Keywords ***
Open Browser To Menu Page
    Open Browser    ${URL}    ${BROWSER}    headless=${True}
    Maximize Browser Window

Teardown Browser
    Close Browser

