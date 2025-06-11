*** Settings ***
Resource        ../src/resources/pages/menu_page.robot
Resource        ../src/resources/common.robot

*** Test Cases ***
Proceed Payment When Cart Is Empty
    Open Browser To Menu Page
    Element Should Contain    ${TOTAL_BUTTON_XPATH}    Total: $0.00
    Open Payment Form
    Fill Payment Details
    Submit Order
    Close Browser