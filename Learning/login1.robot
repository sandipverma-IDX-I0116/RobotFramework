*** Settings ***
Library    SeleniumLibrary

*** Variables ***
# Test Data
${username}     student
${password}     Password123
${invalidUsername}      incorrectUser
${invalidPassword}      incorrectPassword

${website}      https://practicetestautomation.com/practice-test-login/

# Locators
${loginField}    xpath://input[@id="username"]
${passwordField}    xpath://input[@id="password"]
${loginButton}      xpath://button[@id="submit"]
${logoutButton}     xpath://a[text()="Log out"]

*** Keywords ***
Open Practice Web On Chrome
    Open Browser    ${website}     Chrome

Close The Browser
    Close Browser

Enter Username and Password on Login Page and Click Login Button
    [Documentation]     This enters username and password to login page
    [Arguments]     ${username}     ${password}
    Input Text      ${loginField}       ${username}
    Input Password      ${passwordField}       ${password}
    Click Button      ${loginButton}

Click Logout Button
    click element   ${logoutButton}

*** Test Cases ***
Test Login1: Positive LogIn test
    Open Practice Web On Chrome
    Enter Username and Password on Login Page and Click Login Button       ${username}     ${password}
    Page should contain     Congratulations
    Click Logout Button
    Close The Browser

Test Login2: Negative username test
    Open Practice Web On Chrome
    Enter Username and Password on Login Page and Click Login Button       ${invalidUsername}     ${password}
    Page should contain     Your username is invalid!
    Close The Browser

Test Login3: Negative password test
    Open Practice Web On Chrome
    Enter Username and Password on Login Page and Click Login Button       ${username}     ${invalidPassword}
    Page should contain     Your password is invalid!
    Close The Browser