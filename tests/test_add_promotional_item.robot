*** Settings ***
Resource    ../src/resources/common.robot
Resource    ../src/resources/pages/yuliia_tests_data.robot


*** Test Cases ***
Add Promotional Item
    Open Browser To Menu Page
    Add Coffee Item To Cart    Espresso     # 1
    Cart Icon Should Show Count    1
    Add Coffee Item To Cart    Espresso_Macchiato     # 2
    Cart Icon Should Show Count    2
    Add Coffee Item To Cart    Cappuccino     # 3
    Promotional Dialog Should Appear
    Click Promotional Dialog Button Yes
    Cart Icon Should Show Count    4
    Add Coffee Item To Cart    Espresso     # 5
    Cart Icon Should Show Count    5
    Add Coffee Item To Cart    Espresso_Macchiato     # 6
    Promotional Dialog Should Appear
    Click Promotional Dialog Button No
    Cart Icon Should Show Count    6
    Add Coffee Item To Cart    Cappuccino     # 7
    Cart Icon Should Show Count    7
    Add Coffee Item To Cart    Espresso     # 8
    Cart Icon Should Show Count    8
    Add Coffee Item To Cart    Espresso_Macchiato     # 9
    Promotional Dialog Should Appear
    Click Another Coffee Item During Dialog    Cappuccino
    Cart Icon Should Show Count    10
    Teardown Browser
