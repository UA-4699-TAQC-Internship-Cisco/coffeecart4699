*** Settings ***
Resource    ../src/resources/common.robot
Resource    ../src/resources/pages/menu_page.robot


*** Test Cases ***
Right Click Opens The "Add To Cart" Dialog
    Open Browser To Menu Page
    Right Click On Coffee By Name    Espresso
    Verify Add To Cart Dialog Appears
    Teardown Browser

