*** Settings ***
Resource        ../src/resources/pages/menu_page.robot
Library         SeleniumLibrary

*** Variables ***
${BROWSER}      Chrome
${URL}          https://coffee-cart.app/

*** Test Cases ***
Add Coffee Item to Cart and Verify Cart Preview
    [Documentation]    This test verifies that clicking a coffee icon below a product adds the item to the cart and updates the cart UI (count, total, preview info).

    Open Browser       ${URL}    ${BROWSER}    executable_path=C:/WebDrivers/chromedriver-win64/chromedriver.exe
    Set Window Size    1600    1000
    Set Selenium Implicit Wait   10

    # Step 1: Ensure at least one product is displayed
    Page Should Contain Element    xpath=//*[@id="app"]/div[2]/ul/li[1]/div/div/div[1]

    # Step 2: Click on the coffee icon to add the item
    Click Element    xpath=//*[@id="app"]/div[2]/ul/li[1]/div/div/div[1]

    # Step 3: Wait until Total button updates
    Wait Until Element Contains    xpath=//*[@id="app"]/div[2]/div[1]/button    Total: $    5s

    # Step 4: Hover over Total button to open cart preview
    Mouse Over    xpath=//*[@id="app"]/div[2]/div[1]/button
    Sleep         1s

    # Step 5: Verify cart preview contains at least one item
    Wait Until Page Contains Element    xpath=//ul[contains(@class, 'cart-preview')]    5s
    Page Should Contain Element         xpath=//ul[contains(@class, 'cart-preview')]/li[contains(@class, 'list-item')]
    Page Should Contain Element         xpath=//span[contains(@class, 'unit-desc') and contains(text(), 'x')]
    Page Should Contain Element         xpath=//button[@aria-label="Proceed to checkout"]


    # Step 6: Screenshot for validation
    Capture Element Screenshot     xpath=//ul[contains(@class, 'cart-preview')]

    Close Browser
