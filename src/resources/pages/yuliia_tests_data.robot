*** Settings ***
Library         SeleniumLibrary


*** Keywords ***
Right Click On Coffee Icon
    Execute Javascript    var evt = new MouseEvent('contextmenu', {bubbles: true, cancelable: true, view: window}); document.querySelector('div[data-test="Espresso"]').dispatchEvent(evt);

Verify Add To Cart Dialog Appears
    Wait Until Element Is Visible    css:#app > dialog    10s

