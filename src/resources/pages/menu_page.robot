*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${CART_PAGE_LINK_XPATH}        //a[@aria-label="Cart page"]
${CAPPUCCINO_TITLE}             //*[@id="app"]/div[2]/ul/li[3]/h4
${TOTAL_BUTTON}                //button[@aria-label="Proceed to checkout"]
${PAYMENT_DETAILS_WINDOW}        class:modal
${INPUT_FIELD_FORM}                id:name
${EMAIL_FIELD_FORM}                id:email
${SUBMIT_BUTTON}                   //*[@id="submit-payment"]

*** Keywords ***
Go to Card Page
    Wait Until Element Is Visible    ${CART_PAGE_LINK_XPATH}
    Click Link    ${CART_PAGE_LINK_XPATH}

Proceed Payment
    Wait Until Element Is Visible    ${PAYMENT_DETAILS_WINDOW}
    Click Element                    ${INPUT_FIELD_FORM}
    Input Text                       ${INPUT_FIELD_FORM}    Test1
    Click Element                    ${EMAIL_FIELD_FORM}
    Input Text                       ${EMAIL_FIELD_FORM}    some@i.mail.com
    Click Element                    ${SUBMIT_BUTTON}