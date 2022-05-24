*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Add Message to Spittr
    Open Browser    http://localhost:8080/spittr/login    Firefox
    wait until element is visible  //input[@name="submit"]
    input text   //input[@name="username"]  tzs919
    input text   //input[@name="password"]  123456
    click element  //input[@name="submit"]
    wait until element is visible  link:Spittles
    element should be visible   link:Logout
    click element    link:Spittles
    wait until element is visible  //textarea[@name="message"]
    input text   //textarea[@name="message"]  abcdefghijkl
    click element   xpath://input[@type="submit"]
    page should contain element   //div[@class="spittleMessage"]
    element text should be   //div[@class="spittleMessage"][1]  abcdefghijkl

    capture page screenshot
    capture element screenshot   //div[@class="spittleMessage"][1]

#    log title
    ${newtext} =     get text    //div[@class="spittleMessage"][1]
    log  ${newtext}

    [Teardown]    Close Browser
