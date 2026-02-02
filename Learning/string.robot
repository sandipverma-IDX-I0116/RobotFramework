*** Settings ***
Library     String



*** Variables ***
${TEXT}        Hello Robot Framework
${EMPTY}
${MULTILINE}   First line
...            Second line
...            Robot Framework line
...            I am Sandip




*** Test Cases ***
Catenate Example
    ${result}=    Catenate    SEPARATOR=     Hello    World
    Should Be Equal As Strings    ${result}    Hello World

Get Length Example
    ${len}=    Get Length    ${TEXT}
    Log    Length is ${len}

Length Should Be Example
    Length Should Be    ${TEXT}    21

Should Match And Not Match Regexp
    Should Match Regexp    ${TEXT}    Hello.*
    Should Not Match Regexp    ${TEXT}    ^Robot

Should Be Empty And Not Be Empty
    Should Be Empty    ${EMPTY}
    Should Not Be Empty    ${TEXT}

Should Be Equal Variants
    Should Be Equal As Strings    123    123
    Should Be Equal As Integers   10     10
    Should Be Equal As Numbers    10.5   10.5

Should Contain Examples
    Should Contain    ${TEXT}    Robot
    Should Not Contain    ${TEXT}    Python

Start And End With Examples
    Should Start With    ${TEXT}    Hello
    Should End With      ${TEXT}    Framework

Fetch From Left And Right
    ${left}=     Fetch From Left    ${TEXT}    Robot
    ${right}=    Fetch From Right   ${TEXT}    Robot
    Log    ${left}
    Log    ${right}

Generate Random String
    ${rand}=    Generate Random String    8    [LETTERS]
    Log    Random string: ${rand}

Get Line And Line Count
    ${line}=    Get Line    ${MULTILINE}    1
    ${count}=   Get Line Count    ${MULTILINE}
    Log    ${line}
    Log    Line count: ${count}

Get Lines Containing And Matching
    ${contain}=    Get Lines Containing String    ${MULTILINE}    Robot
    ${match}=      Get Lines Matching Regexp      ${MULTILINE}    ^Second.*
    Log    ${contain}
    Log    ${match}

Get Substring
    ${sub}=    Get Substring    ${TEXT}    6    11
    Log    ${sub}

Replace String
    ${new}=    Replace String    ${TEXT}    Robot    Python
    Log    ${new}

Replace String Using Regexp
    ${new}=    Replace String Using Regexp    ${TEXT}    Framework$    Tool
    Log    ${new}

Case Validation Keywords
    Should Be Lowercase    hello
    Should Be Uppercase    HELLO
    Should Be Titlecase   Hello Robot
    Should Be String      ${TEXT}
    Should Not Be String  123

Split String Examples
    @{parts}=    Split String    ${TEXT}    ${SPACE}
    Log    ${parts}

Split String From Right
    @{parts}=    Split String From Right    ${TEXT}    ${SPACE}    1
    Log    ${parts}

Split To Lines
    @{lines}=    Split To Lines    ${MULTILINE}
    Log    ${lines}