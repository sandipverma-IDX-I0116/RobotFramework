*** Settings ***
Library     SeleniumLibrary
Resource    form_keyword.resource


#Suite Setup
Test Setup      Open Practice Web On Chrome

Task Teardown       Close The Browser
#Suite Teardown


*** Test Cases ***
Test Complete Form
#    Open Practice Web On Chrome
#    Set Selenium Speed    0.05s
    Enter Name,Email,Phone And Address On The Form    ${name}     ${email}      ${phone}    ${address}
    Verify Name,Email,Phone And Address On The Form     ${name}     ${email}      ${phone}    ${address}

    Select Gender Radio Button On The Form      ${genderValue}
    Verify Gender Radio Button On The Form      ${genderValue}

    FOR    ${element}    IN    @{dayList}
        Select Day Checkbox On The Form     ${element}
    END
    FOR    ${element}    IN    @{dayList}
        Verify Day Checkbox On The Form    ${element}
    END

    Select Country From Dropdown On The Form    ${dropdownValue}
    Verify Country From Dropdown On The Form    ${dropdownValue}

    Select Color From Colors List On The Form   @{colorList}
    Verify Selected Colors From Colors List On The Form     ${colorList}

    FOR    ${counter}    IN RANGE    0    5    2
        Select Element From List By Index       ${sortedListId}    ${counter}
    END

    Enter Date From Date Picker 1   ${month}   ${day}     ${year}
    Enter Date From Date Picker 2   ${day1}   ${month1char}     ${year1}

    Verify Date From Date Picker 1      ${month}   ${day}     ${year}
    Verify Date From Date Picker 2      ${day1}   ${month1}     ${year1}

    Enter Date From Date Picker 3   ${day}  ${month}    ${year}     ${day1}     ${month1}   ${year1}
    Verify Date From Date Picker 3  ${day}  ${month}    ${year}     ${day1}     ${month1}   ${year1}

    Click On Submit Button      ${submitButton}
    Verify Click On Submit Button

    Choose and Upload Signle File   ${filePath}
    Verify Upload Signle File   ${filePath}

    Choose and Upload Multiple Files    ${multipleFilePath}
    Verify Upload Multiple File     ${multipleFilePath}

    Sleep   2s
#    Close The Browser