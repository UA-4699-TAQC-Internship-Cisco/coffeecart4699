*** Settings ***
Library         SeleniumLibrary


*** Keywords ***
Right Click On Coffee Icon
    Execute Javascript    var evt = new MouseEvent('contextmenu', {bubbles: true, cancelable: true, view: window}); document.querySelector('div[data-test="Espresso"]').dispatchEvent(evt);

Verify Add To Cart Dialog Appears
    Wait Until Element Is Visible    css:#app > dialog    10s

Add Coffee Item To Cart
    [Arguments]    ${item_name}
    Click Element    xpath=//div[contains(@data-test, "${item_name}")]

Cart Icon Should Show Count
    [Arguments]    ${expected_count}
    ${text}=    Get Text    xpath=//a[contains(@aria-label, "Cart page")]
    Log    Cart icon text: ${text}
    Should Contain    ${text}    (${expected_count})

Promotional Dialog Should Appear
    Wait Until Element Is Visible    xpath=//div[contains(@class, "promo")]    10s

Click Promotional Dialog Button Yes
    Click Button    css:div.promo button.yes

Click Promotional Dialog Button No
    Click Button    xpath=//div[contains(@class, "promo")]//button[normalize-space(text())="Nah, I'll skip."]

Click Another Coffee Item During Dialog
    [Arguments]    ${item_name}
    Click Element    xpath=//div[contains(@data-test, "${item_name}")]

Add Espresso To Cart
    Click Element    css:div[data-test="Espresso"]

Open Cart
    Click Element    xpath = //a[@aria-label="Cart page" and contains(@href, "/cart")]

Reload Current Page
    Reload Page

Cart Icon Should Show Items
    Wait Until Element Is Visible    xpath=//*[@id="app"]/div[2]    10s
    ${item_text}=    Get Text    xpath=//*[@id="app"]/div[2]/div/ul/li[2]
    Should Contain    ${item_text}    Espresso
    Should Contain    ${item_text}    1