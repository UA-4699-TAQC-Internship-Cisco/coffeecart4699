*** Settings ***
Resource    ../src/resources/common.robot
Resource    ../src/resources/pages/yuliia_tests_data.robot


*** Test Cases ***
Right Click Opens The "Add To Cart" Dialog
    Open Browser To Menu Page
    Right Click On Coffee Icon
    Verify Add To Cart Dialog Appears
    Teardown Browser

