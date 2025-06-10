*** Settings ***
Resource    ../src/resources/common.robot
Resource    ../src/resources/pages/menu_page.robot


*** Test Cases ***
Add Promotional Item
    Open Browser To Menu Page
    Click On Coffee By Name    Espresso
    Cart Icon Should Show Count    1
    Click On Coffee By Name    Espresso_Macchiato
    Cart Icon Should Show Count    2
    Click On Coffee By Name    Cappuccino
    Promotional Dialog Should Appear
    Click Promotional Dialog Button Yes
    Cart Icon Should Show Count    4
    Click On Coffee By Name    Espresso
    Cart Icon Should Show Count    5
    Click On Coffee By Name    Espresso_Macchiato
    Promotional Dialog Should Appear
    Click Promotional Dialog Button No
    Cart Icon Should Show Count    6
    Click On Coffee By Name    Cappuccino
    Cart Icon Should Show Count    7
    Click On Coffee By Name    Espresso
    Cart Icon Should Show Count    8
    Click On Coffee By Name    Espresso_Macchiato
    Promotional Dialog Should Appear
    Click On Coffee By Name    Cappuccino
    Cart Icon Should Show Count    10
    Teardown Browser
