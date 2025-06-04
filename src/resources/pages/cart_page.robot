*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${ESPRESSO_PLUS_XPATH}        //*[@id="app"]/div[2]/div/ul/li[2]/div[2]/div/button[1]
${ESPRESSO_MINUS_XPATH}       //*[@id="app"]/div[2]/div/ul/li[2]/div[2]/div/button[2]



*** Keywords ***
Increase Quantity Of Item
    Click Element Multiple Times    ${ESPRESSO_PLUS_XPATH}   1


Decrease Quantity Of Item
    Click Element Multiple Times    ${ESPRESSO_MINUS_XPATH}   2



Click Element Multiple Times
    [Arguments]    ${locator}    ${times}
    FOR    ${index}    IN RANGE    ${times}
        Click Element    ${locator}
    END

