*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${ESPRESSO_PLUS_XPATH}        //*[@id="app"]/div[2]/div/ul/li[2]/div[2]/div/button[1]
${ESPRESSO_MINUS_XPATH}       //*[@id="app"]/div[2]/div/ul/li[2]/div[2]/div/button[2]
${DELETE_BUTTON_XPATH}      //*[@id="app"]/div[2]/div/ul/li[@class="list-item"]




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



Delete Few Elements
    ${delete_buttons}=    Get WebElements    ${DELETE_BUTTON_XPATH}
    ${count}=    Get Length    ${delete_buttons}
    FOR    ${index}    IN RANGE    ${count}
        Click Element    xpath=//*[@id="app"]/div[2]/div/ul/li[2]/div[4]/button
    END



Verify Text
    [Arguments]    ${locator}    ${expected}
     ${text}=    Get Text        ${locator}
     ${result}=    Evaluate    " ".join("""${text}""".split())

    Should Be Equal As Strings    ${result}   ${expected}

