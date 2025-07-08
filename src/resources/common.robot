*** Settings ***
Library    SeleniumLibrary
Library    Process
Library    Collections
Resource       ..\src\resources\variables.resource

****** Variables ***


*** Keywords ***
Open Browser To Menu Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    

Teardown Browser
    Close Browser

Ignore Requirements Error
    Run Keyword And Ignore Error    File Should Not Exist    requirements.txt
