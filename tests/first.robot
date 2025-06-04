*** Settings ***
Resource        ../src/resources/pages/menu_page.robot
Library         SeleniumLibrary


*** Variables ***

${BROWSER}         Chrome
${URL}             https://coffee-cart.app/

*** Test Cases ***
first

    Log    Hello World

Open
    Open Browser    ${URL}      ${BROWSER}
    sleep   5
    Add Espresso to cart
    sleep   3
    Go to Card Page

    sleep   5
    Close Browser