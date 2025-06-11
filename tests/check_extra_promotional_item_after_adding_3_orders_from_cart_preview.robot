*** Settings ***
Resource        ../src/resources/pages/menu_page.robot
Library         SeleniumLibrary

*** Variables ***
${BROWSER}      Chrome
${URL}          https://coffee-cart.app/

*** Test Cases ***
Verify No Promo Item Appears After Adding Items via Cart Preview
    [Documentation]    This test ensures no promotional item appears after adding 3+ items using cart preview only.

    Open Browser       ${URL}    ${BROWSER}    executable_path=C:/WebDrivers/chromedriver-win64/chromedriver.exe
    Set Window Size    1600    1000
    Set Selenium Implicit Wait   10

    # Add one product from the main product grid
    Click Element    xpath=//*[@id="app"]/div[2]/ul/li[1]/div/div/div[1]

    # Hover over the "Total" button to trigger cart preview
    Mouse Over    xpath=//*[@id="app"]/div[2]/div[1]/button

    # Wait until cart preview becomes visible
    Wait Until Element Is Visible    xpath=//ul[contains(@class, 'cart-preview') and contains(@class, 'show')]    10s

    # Click "+" button three times for the first item in preview
    Click Element    xpath=(//button[contains(@aria-label, 'Add one')])[1]
    Click Element    xpath=(//button[contains(@aria-label, 'Add one')])[1]
    Click Element    xpath=(//button[contains(@aria-label, 'Add one')])[1]

    # Capture a screenshot of the cart preview
    Capture Element Screenshot     xpath=//ul[contains(@class, 'cart-preview')]

    # Assert that promotional item did NOT appear
    Element Should Not Be Visible  xpath=//div[contains(text(), 'Promo')]

    Close Browser
