*** Settings ***
Resource        ../src/resources/config.robot
Resource        ../src/resources/pages/menu_page.robot
Library         SeleniumLibrary

*** Test Cases ***
Add Coffee Item to Cart and Verify Cart Preview
    [Documentation]    This test verifies that clicking a coffee icon below a product adds the item to the cart and updates the cart UI (count, total, preview info).

    Open Browser       ${URL}    ${BROWSER}
    Set Window Size    ${WINDOW_WIDTH}    ${WINDOW_HEIGHT}
    Set Selenium Implicit Wait   ${SELENIUM_IMPLICIT_WAIT}

    Ensure Product Is Visible
    Click Coffee Icon To Add Item
    Wait For Total Button To Update
    Open Cart Preview
    Verify Cart Preview Content
    Capture Cart Screenshot

    Close Browser
