*** Settings ***
Resource        ../src/resources/pages/menu_page.robot
Library         SeleniumLibrary


*** Variables ***
${BROWSER}          Chrome
${URL}              https://coffee-cart.app/


*** Test Cases ***
first
    Log    Hello World

Open
    Open Browser         ${URL}             ${BROWSER}
    Go to Card Page
    Close Browser