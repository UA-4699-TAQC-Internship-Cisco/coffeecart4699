*** Settings ***
Resource        ../src/resources/pages/menu_page.robot
Resource        ../src/resources/common.robot
Library         SeleniumLibrary
Test Setup      Open Browser To Menu Page
Test Teardown   Teardown Browser


*** Test Cases ***

Delete one item by tapping x button


    Go to Card Page
    ${cart_text}=    Get Text       xpath://*[@id="app"]/div[2]/p
    ${result}=    Evaluate    " ".join("""${cart_text}""".split())
    Should Be Equal As Strings    ${result}    No coffee, go add some.
