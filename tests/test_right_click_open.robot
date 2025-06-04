*** Settings ***
Resource    ../src/resources/common.robot

*** Test Cases ***
Right Click Opens The "Add To Cart" Dialog
    Open Browser To Menu Page
    Right Click On Coffee Icon
    Verify Add To Cart Dialog Appears
    Teardown Browser

*** Keywords ***
Right Click On Coffee Icon
    Execute Javascript    var evt = new MouseEvent('contextmenu', {bubbles: true, cancelable: true, view: window}); document.querySelector('div[data-test="Espresso"]').dispatchEvent(evt);

Verify Add To Cart Dialog Appears
    Wait Until Element Is Visible    css:#app > dialog    10s
