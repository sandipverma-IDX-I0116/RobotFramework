*** Settings ***
Library    SeleniumLibrary
Library     Collections
Library     utils.py
Library    String

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
@{dayList}      sunday  tuesday     friday


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


*** Keywords ***
Open Practice Web On Chrome
    Open Browser    ${website}     Chrome
    Maximize Browser Window

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
    ${startdate}    Get Value       ${startDateField}
    ${enddate}    Get Value         ${endDateField}
    ${diff}    Diff    ${startdate}    ${enddate}
    Page Should Contain     You selected a range of ${diff} days.

Verify Upload Signle File
    [Arguments]     ${filePath}
    ${file}      Find Filename    ${filePath}
    Page Should Contain     Single file selected: ${file}

Verify Upload Multiple File
    [Arguments]     ${multipleFilePath}
    Page Should Contain     Multiple files selected:
    @{files}    Split String    ${multipleFilePath}     \\n
    FOR    ${file}    IN    @{files}
        ${file}     Find Filename    ${file}
        Page Should Contain    ${file}
    END