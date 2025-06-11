*** Settings ***
Resource        ../src/resources/config.robot
Resource        ../src/resources/pages/menu_page.robot
Library         SeleniumLibrary

*** Test Cases ***
Submit Order and Verify Confirmation
    [Documentation]    This test verifies that submitting the payment form with valid data completes the order and shows confirmation feedback.

    Open Browser       ${URL}    ${BROWSER}
    Set Window Size    ${WINDOW_WIDTH}    ${WINDOW_HEIGHT}
    Set Selenium Implicit Wait   ${SELENIUM_IMPLICIT_WAIT}

    Add First Item To Cart
    Open Payment Form
    Fill Payment Details
    Submit Order
    Verify Confirmation Snackbar

    Reload Page
    Verify Cart Is Empty
    Verify Modal Is Hidden

    Close Browser
