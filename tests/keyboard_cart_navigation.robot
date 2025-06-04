*** Settings ***
Resource        ../src/resources/common.robot

*** Test Cases ***
Verify Empty Cart Navigation With Keyboard
    [Documentation]    TC2: Test keyboard navigation to empty cart
    Open Browser To Menu Page
    Press Keys    None    TAB      TAB  ENTER
    Wait Until Location Contains    /cart
    Verify Empty Cart State
    Press Keys    None    SHIFT+TAB  ENTER
    Wait Until Location Contains    ${URL}
    Verify Menu Page Loaded
    [Teardown]    Teardown Browser

*** Keywords ***
Verify Empty Cart State
    Page Should Contain Element    xpath = //*[@id="app"]/div[2]/p

Verify Menu Page Loaded
    Page Should Contain Element    xpath = //*[@id="app"]/div[2]/ul/li[1]/div/div/div[@aria-label="Espresso"]