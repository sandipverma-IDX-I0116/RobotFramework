*** Settings ***
Library    SeleniumLibrary
Library     Collections
Library    String

Resource    login_keywords.resource

*** Variables ***
${website}      https://testautomationpractice.blogspot.com/

# Test Data
${name}     Sandip
${email}    sandip@gmail.com
${phone}    9898989898
${address}  123,ABC,DEF XYZ 123654
${genderValue}  male
${dropdownValue}    india
${month}   08
${day}      26
${year}     2027
${month1}   08
${month1char}   Aug
${day1}      26
${year1}     2028
${filePath}     C:\\Users\\Sandip.Verma\\Downloads\\image.png
${filePath1}    C:\\Users\\Sandip.Verma\\Downloads\\AMS Voyager.txt
${multipleFilePath}     ${filePath}\n${filePath1}
@{colorList}    Blue    White



# Locators
${nameField}    xpath://input[@id="name"]
${emailField}   xpath://input[@id="email"]
${phoneField}   xpath://input[@id="phone"]
${addressField}   xpath://textarea[@id="textarea"]
${genderGroup}  gender
${dropdownId}   country
${countryDropdownId}   country
${colorsListId}     colors
${sortedListId}     animals
${datePicker1Id}    datepicker
${datePicker2Id}    txtDate
${monthSelector}    xpath://select[@class="ui-datepicker-month"]
${yearSelector}     xpath://select[@class="ui-datepicker-year"]
${startDateField}   xpath://input[@id="start-date"]
${endDateField}     xpath://input[@id="end-date"]
${submitButton}     xpath://button[@class="submit-btn"]
${chooseFile}       singleFileInput
${uploadSingleFile}     xpath://button[contains(text(),"Single File")]
${chooseFiles}      multipleFilesInput
${uploadMultipleFile}   xpath://button[contains(text(),"Multiple File")]

${str}      xpath://button[contains(text(),"this is replace")]



*** Keywords ***
Open Practice Web On Chrome
    Open Browser    ${website}     Chrome

Close The Browser
    Close Browser

Enter Name In Name Field
    [Documentation]     This enters name in name field of the form.
    [Arguments]        ${name}
    Wait Until Element IS Visible    ${nameField}
    Input Text      ${nameField}    ${name}

Enter Name And Email On The Form
    [Documentation]     This enters name and email in fields of the form.
    [Arguments]        ${name}      ${email}
    Enter Name In Name Field    ${name}
    Wait Until Element IS Visible    ${emailField}
    Input Text      ${emailField}    ${email}

Enter Name,Email And Phone On The Form
    [Documentation]     This enters name,email and phone in fields of the form.
    [Arguments]        ${name}      ${email}    ${phone}
    Enter Name And Email On The Form    ${name}      ${email}
    Wait Until Element IS Visible    ${phoneField}
    Input Text      ${phoneField}    ${phone}

Enter Name,Email,Phone And Address On The Form
    [Documentation]     This enters name,email,phone and address in fields of the form.
    [Arguments]        ${name}      ${email}    ${phone}    ${address}
    Enter Name,Email And Phone On The Form    ${name}      ${email}     ${phone}
    Wait Until Element IS Visible    ${addressField}
    Input Text      ${addressField}    ${address}

Select Gender Radio Button On The Form
    [Arguments]      ${genderValue}
    Wait Until Element IS Visible   ${genderValue}
    Select Radio Button     ${genderGroup}      ${genderValue}
#    Radio Button Should Be Set To   ${genderGroup}      ${genderValue}

Select Day Checkbox On The Form
    [Arguments]     ${dayid}
    Wait Until Element IS Visible   ${dayid}
    Select Checkbox     id=${dayid}
#    Checkbox Should Be Selected    id=${dayid}

Select Country From Dropdown On The Form
    [Arguments]     ${dropdownValue}
    Wait Until Element IS Visible   ${dropdownId}
    Select From List By Value   id=${dropdownId}    ${dropdownValue}
#    List Selection Should Be    id=${dropdownId}    ${dropdownValue}

Select Color From Colors List On The Form
    [Arguments]     @{colorList}
    Wait Until Element IS Visible   ${colorsListId}
    Select From List By Label   id=${colorsListId}      @{colorList}

Select Element From List By Index
    [Arguments]     ${listId}   ${index}
    Wait Until Element IS Visible   ${listId}
    Select From List By Index   ${listId}   ${index}

Enter Date From Date Picker 1
    [Arguments]     ${month}   ${day}     ${year}
    Wait Until Element IS Visible   ${datePicker1Id}
    Input Text      ${datePicker1Id}    ${month}/${day}/${year}

Enter Date From Date Picker 2
    [Arguments]     ${day1}   ${month1char}     ${year1}
    Wait Until Element IS Visible   ${datePicker2Id}
    Click Element   id=${datePicker2Id}
    Wait Until Element IS Visible   ${monthSelector}
    Wait Until Element IS Visible   ${yearSelector}
    Wait Until Element IS Visible   xpath://a[text()=${day1}]
    Select From List By Label   ${monthSelector}    ${month1char}
    Select From List By Label   ${yearSelector}     ${year1}
    Click Element   xpath://a[text()=${day1}]

Enter Date From Date Picker 3
    [Arguments]     ${day}  ${month}    ${year}     ${day1}     ${month1}   ${year1}
    Wait Until Element IS Visible   ${startDateField}
    Wait Until Element IS Visible   ${endDateField}
    Input Text      ${startDateField}    ${day}${month}${year}
    Input Text      ${endDateField}    ${day1}${month1}${year1}

Click On Submit Button
    [Arguments]     ${submitButton}
    Wait Until Element IS Visible   ${submitButton}
    Click Button    ${submitButton}

Choose and Upload Signle File
    [Arguments]     ${filePath}
    Wait Until Element Is Visible   ${chooseFile}
    Choose File     id=${chooseFile}   ${filePath}
    Click Button    ${uploadSingleFile}

Choose and Upload Multiple Files
    [Arguments]     ${multipleFilePath}
    Wait Until Element Is Visible   ${chooseFiles}
    Choose File     id=${chooseFiles}   ${multipleFilePath}
    Click Button    ${uploadMultipleFile}


# Assertions
Verify Name,Email,Phone And Address On The Form
    [Arguments]        ${name}      ${email}    ${phone}    ${address}
    ${getName}=    Get Value    ${nameField}
    Should Be Equal     ${getName}      ${name}
    ${getEmail}=    Get Value    ${emailField}
    Should Be Equal     ${getEmail}      ${email}
    ${getPhone}=    Get Value    ${phoneField}
    Should Be Equal     ${getPhone}      ${phone}
    ${getAddress}=    Get Value    ${addressField}
    Should Be Equal     ${getAddress}      ${address}

Verify Gender Radio Button On The Form
    [Arguments]      ${genderValue}
    Radio Button Should Be Set To   ${genderGroup}      ${genderValue}

Verify Day Checkbox On The Form
    [Arguments]     ${dayid}
    Checkbox Should Be Selected    id=${dayid}

Verify Country From Dropdown On The Form
    [Arguments]     ${dropdownValue}
    List Selection Should Be    id=${dropdownId}    ${dropdownValue}

Verify Selected Colors From Colors List On The Form
    [Arguments]    ${colorList}
    ${selected}     Get Selected List Labels    id=${colorsListId}
    Lists Should Be Equal    ${selected}    ${colorList}

Verify Date From Date Picker 1
    [Arguments]      ${month}   ${day}     ${year}
    ${date}    Get Value   ${datePicker1Id}
    Should Be Equal     ${date}    ${month}/${day}/${year}

Verify Date From Date Picker 2
    [Arguments]      ${day1}   ${month1}     ${year1}
    ${date}    Get Value   ${datePicker2Id}
    Should Be Equal     ${date}    ${day1}/${month1}/${year1}

Verify Date From Date Picker 3
    [Arguments]     ${day}  ${month}    ${year}     ${day1}     ${month1}   ${year1}
    ${startdate}    Get Value       ${startDateField}
    ${enddate}    Get Value         ${endDateField}
#    Log To Console   ${startdate} ${enddate}
    Should Be Equal     ${startdate}    ${year}-${month}-${day}
    Should Be Equal     ${enddate}    ${year1}-${month1}-${day1}

Verify Click On Submit Button
    Page Should Contain     You selected a range of

Verify Upload Signle File
    Page Should Contain     Single file selected

Verify Upload Multiple File
    Page Should Contain     Multiple files selected



*** Test Cases ***
#Test Name
#    Open Practice Web On Chrome
#    Enter Name In Name Field    ${name}
#    Close The Browser
#
#Test Name And Email
#    Open Practice Web On Chrome
#    Enter Name And Email On The Form    ${name}     ${email}
#    Close The Browser
#
#Test Name,Email And Phone
#    Open Practice Web On Chrome
#    Enter Name,Email And Phone On The Form    ${name}     ${email}      ${phone}
#    Close The Browser

#Test Name,Email,Phone And Address
#    Open Practice Web On Chrome
##    Set Selenium Speed    0.1s
#    Enter Name,Email,Phone And Address On The Form    ${name}     ${email}      ${phone}    ${address}
#    Close The Browser
#
#Test Select Gender Radio Button
#    Open Practice Web On Chrome
##    Set Selenium Speed    0.1s
#    Select Gender Radio Button On The Form      ${genderValue}
#    Close The Browser
#
#Test Select Days Checbox
#    Open Practice Web On Chrome
##    Set Selenium Speed    0.1s
#    Select Day Checkbox On The Form     sunday
#    Select Day Checkbox On The Form     tuesday
#    Select Day Checkbox On The Form     friday
#    Close The Browser
#
#Test Select Country From Dropdown
#    Open Practice Web On Chrome
##    Set Selenium Speed    0.1s
#    Select Country From Dropdown On The Form    ${dropdownValue}
#    Close The Browser
#
#Test Select Colors From List
#    Open Practice Web On Chrome
##    Set Selenium Speed    0.1s
#    Select Color From Colors List On The Form   Blue
#    Select Color From Colors List On The Form   Green
#    Close The Browser
#
#Test Select Element From Sorted List
#    Open Practice Web On Chrome
##    Set Selenium Speed    0.1s
#    Select Element From List By Index       ${sortedListId}     0
#    Select Element From List By Index       ${sortedListId}     2
#    Select Element From List By Index       ${sortedListId}     4
#    Close The Browser

#Test Enter Date In Date Picker 1
#    Open Practice Web On Chrome
##    Set Selenium Speed    0.1s
#    Enter Date From Date Picker 1   ${month}   ${day}     ${year}
#    Close The Browser

#Test Enter Date In Date Picker 2
#    Open Practice Web On Chrome
##    Set Selenium Speed    0.2s
#    Enter Date From Date Picker 2   ${day1}   ${month1char}     ${year1}
#    Close The Browser

#Test Enter Date In Date Picker 3
#    Open Practice Web On Chrome
##    Set Selenium Speed    0.4s
#    Enter Date From Date Picker 3   ${day}  ${month}    ${year}     ${day1}     ${month1}   ${year1}
#    Close The Browser

#Test Click Submit Button
#    Open Practice Web On Chrome
#    Enter Date From Date Picker 3   ${day}  ${month}    ${year}     ${day1}     ${month1}   ${year1}
#    Click On Submit Button     ${submitButton}
#    Close The Browser

Test Complete Form
    Open Practice Web On Chrome
#    Set Selenium Speed    0.05s
    Enter Name,Email,Phone And Address On The Form    ${name}     ${email}      ${phone}    ${address}
    Verify Name,Email,Phone And Address On The Form     ${name}     ${email}      ${phone}    ${address}

    Select Gender Radio Button On The Form      ${genderValue}
    Verify Gender Radio Button On The Form      ${genderValue}

    Select Day Checkbox On The Form     sunday
    Select Day Checkbox On The Form     tuesday
    Select Day Checkbox On The Form     friday

    Verify Day Checkbox On The Form     sunday
    Verify Day Checkbox On The Form     tuesday
    Verify Day Checkbox On The Form     friday

    Select Country From Dropdown On The Form    ${dropdownValue}
    Verify Country From Dropdown On The Form    ${dropdownValue}

    Select Color From Colors List On The Form   @{colorList}
    Verify Selected Colors From Colors List On The Form     ${colorList}

    Select Element From List By Index       ${sortedListId}     0
    Select Element From List By Index       ${sortedListId}     2
    Select Element From List By Index       ${sortedListId}     4

    Enter Date From Date Picker 1   ${month}   ${day}     ${year}
    Enter Date From Date Picker 2   ${day1}   ${month1char}     ${year1}

    Verify Date From Date Picker 1      ${month}   ${day}     ${year}
    Verify Date From Date Picker 2      ${day1}   ${month1}     ${year1}

    Enter Date From Date Picker 3   ${day}  ${month}    ${year}     ${day1}     ${month1}   ${year1}
    Verify Date From Date Picker 3  ${day}  ${month}    ${year}     ${day1}     ${month1}   ${year1}

    Click On Submit Button      ${submitButton}
    Verify Click On Submit Button

    Choose and Upload Signle File   ${filePath}
    Verify Upload Signle File

    Choose and Upload Multiple Files    ${multipleFilePath}
    Verify Upload Multiple File

    Sleep   3s
    Close The Browser

testt
    Open Practice Web On Chrome
    ${replaced}     Replace String    ${str}    replace    Login Screen
    Log To Console    ${replaced}
    ${Status}   Run keyword And Return Status    Element Should Be Disabled    //submit
    IF    ${Status}
        Log To Console    true

    END


Test 3
    Login Into the app