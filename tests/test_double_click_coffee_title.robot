*** Settings ***
Resource        ../src/resources/pages/menu_page.robot
Resource        ../src/resources/common.robot

# Espresso      -    1
# Espresso Macchiato  - 2
# Cappuccino    -    3
# Mocha        -     4,
# Flat White   -     5,
# Americano     -    6,
# Cafe Late     -    7,
# Espresso Con Panna - 8,
# Cafe Breve     -    9

*** Test Cases ***
Double Click Coffee Title
    Open Browser To Menu Page
    Double Click On Title            4
    Set Selenium Implicit Wait        15 seconds
    Close Browser