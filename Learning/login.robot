*** Settings ***
Library    SeleniumLibrary

*** Variables ***


*** Keywords ***
Open Practice Web On Chrome
    Open Browser    https://practicetestautomation.com/practice-test-login/     Chrome

Close The Browser
    Close Browser

*** Test Cases ***
Test Login1
    Open Practice Web On Chrome
    Wait Until Element is Visible   xpath://input[@id="username"]
    Input Text      xpath://input[@id="username"]       student
    Wait Until Element is Visible   xpath://input[@id="password"]
    Input Text      xpath://input[@id="password"]     Password123
    Click Button      xpath://button[@id="submit"]
    Page should contain     Congratulations
    Page should contain element     xpath://a[text()="Log out"]
    click element   xpath://a[text()="Log out"]
    Close The Browser

Test Login2
    Open Practice Web On Chrome
    Wait Until Element is Visible   xpath://input[@id="username"]
    Input Text      xpath://input[@id="username"]       incorrectUser
    Wait Until Element is Visible   xpath://input[@id="password"]
    Input Text      xpath://input[@id="password"]     Password123
    Click Button      xpath://button[@id="submit"]
    Page should contain     Your username is invalid!
    Close The Browser

Test Login3
    Open Practice Web On Chrome
    Wait Until Element is Visible   xpath://input[@id="username"]
    Input Text      xpath://input[@id="username"]       student
    Wait Until Element is Visible   xpath://input[@id="password"]
    Input Text      xpath://input[@id="password"]     incorrectPassword
    Click Button      xpath://button[@id="submit"]
    Page should contain     Your password is invalid!
    Close The Browser