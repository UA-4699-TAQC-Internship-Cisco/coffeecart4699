*** Settings ***
Resource        ../src/resources/pages/menu_page.robot
Resource        ../src/resources/common.robot

*** Variables ***
&{Conversion}    1=特浓咖啡     2=浓缩玛奇朵    3=卡布奇诺    4=摩卡    5=平白咖啡    6=美式咖啡    7=拿铁    8=浓缩康宝蓝    9=半拿铁

*** Test Cases ***
Double Click Coffee Title
    Open Browser To Menu Page
    Verify Translation By Double Click       6        &{Conversion}
    Set Selenium Implicit Wait        15 seconds
    Close Browser