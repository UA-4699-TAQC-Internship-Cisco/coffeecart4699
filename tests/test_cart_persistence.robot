*** Settings ***
Resource    ../src/resources/common.robot
Resource    ../src/resources/pages/yuliia_tests_data.robot


*** Test Cases ***
Verify That Cart Items Persist After Page Reload
    Open Browser To Menu Page
    Add Espresso To Cart
    Open Cart
    Reload Current Page
    Cart Icon Should Show Items
    Teardown Browser