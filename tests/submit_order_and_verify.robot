*** Settings ***
Resource        ../src/resources/pages/menu_page.robot
Library         SeleniumLibrary

*** Variables ***
${BROWSER}      Chrome
${URL}          https://coffee-cart.app/

*** Test Cases ***
Submit Order and Verify Confirmation
    [Documentation]    This test verifies that submitting the payment form with valid data completes the order and shows confirmation feedback.

    Open Browser       ${URL}    ${BROWSER}    executable_path=C:/WebDrivers/chromedriver-win64/chromedriver.exe
    Set Window Size    1600    1000
    Set Selenium Implicit Wait   10

    # Add one product from the main grid
    Click Element    xpath=//*[@id="app"]/div[2]/ul/li[1]/div/div/div[1]

    # Open the payment form
    Click Element    xpath=//*[@id="app"]/div[2]/div[1]/button

    # Fill in payment details
    Input Text    xpath=//input[@name="name"]     John Doe
    Input Text    xpath=//input[@name="email"]    test@mail.com

    # Submit the form
    Click Button    xpath=//button[text()="Submit"]

    # Wait for confirmation snackbar to appear
    Wait Until Page Contains Element    xpath=//div[contains(@class, 'snackbar') and contains(text(), 'Thanks for your purchase')]    10s

    # Reload the page
    Reload Page

    # Verify that cart total is now $0.00
    Wait Until Element Contains    xpath=//*[@id="app"]/div[2]/div[1]/button    $0.00    10s

    # Verify that the modal with the form is hidden
    Wait Until Keyword Succeeds    10x    1s    Element Attribute Value Should Be    xpath=//div[contains(@class, "modal")]    style    display: none;



    Close Browser
