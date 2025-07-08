*** Settings ***
Library         SeleniumLibrary
Resource        ../src/resources/pages/menu_page.robot
Resource       ../src/resources/common.robot
Resource       ../src/resources/variables.resource
Test Teardown   Teardown Browser



*** Test Cases ***
#Example Test
#    Open Browser To Menu Page
#        Add your test steps here
#    Teardown Browser

#TC1: first
#    [Tags]    smoke
#    Log    Hello World

#
TC_0: Open
    [Tags]    smoke
    Open Browser         ${URL}             ${BROWSER}
    Go to Cart Page
    Verify Items Count    ${Empty_COUNT}
    Close Browser

#
TC_1: Add Item To Cart
    [Documentation]    User can add one Espresso to cart
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Select Espresso   # працює CSS
    Go to Cart Page
    Verify Cart Contains     Espresso    $10.00 x 1    ${ESPRESSO_PRICE}
    Close Browser


TC_2: Edit (+) Item to the Cart
    [Documentation]    User can add one Espresso to cart
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Select Espresso   # працює CSS
    Go to Cart Page
    Verify Cart Contains     Espresso    $10.00 x 1    ${ESPRESSO_PRICE}
    Add extra (+) Item to the cart
    Verify Cart Contains     Espresso    $10.00 x 2    ${ESPRESSO_PRICE}
    Close Browser


#TC_3: Remove (-) one Item from the cart
#    [Documentation]    User can add one Espresso to cart
#    Open Browser    ${URL}    ${BROWSER}
#    Maximize Browser Window
#    Select Espresso   # працює CSS
#    Go to Cart Page
#    Verify Cart Contains     Espresso    $10.00 x 1    ${ESPRESSO_PRICE}
#    Add extra (+) Item to the cart
#    Add extra (+) Item to the cart
#    Verify Cart Contains     Espresso    $10.00 x 3    ${ESPRESSO_PRICE}
#    Remove (-) one Item from the cart
#    Verify Cart Contains     Espresso    $10.00 x 2    ${ESPRESSO_PRICE}
#    Remove (-) one Item from the cart
#    Verify Cart Contains     Espresso    $10.00 x 1    ${ESPRESSO_PRICE}
#    Remove (-) one Item from the cart
#    Verify Empty Cart
#    Close Browser
#
#
#TC_4: Reload Cart page with an items in the cart
#    [Documentation]    User can reload the page with items in the cart
#    Open Browser    ${URL}    ${BROWSER}
#    Maximize Browser Window
#    Select Espresso   # працює CSS
#    Go to Cart Page
#    Verify Cart Contains     Espresso    $10.00 x 1    ${ESPRESSO_PRICE}
#    Add extra (+) Item to the cart
#    Reload Cart Page
#    Verify Cart Contains     Espresso    $10.00 x 2    ${ESPRESSO_PRICE}
#    Close Browser
