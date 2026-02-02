*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Variables     ../environment.py
Variables    ../PageObjects/api_variables.py

*** Keywords ***
Create API Session
    Create Session    ${SESSION}    ${BASE_URL}

Close API Session
    Delete All Sessions

Get All Todos
    # Create API Session
    ${response}    GET On Session    ${SESSION}    ${todos_endpoint}
    Should Be Equal As Integers    ${response.status_code}    ${get_status_code}
    RETURN    ${response}

Get Single Todo
    [Arguments]    ${todo_id}
    # Create API Session
    ${response}    GET On Session    ${SESSION}    ${todos_endpoint}/${todo_id}
    Should Be Equal As Integers    ${response.status_code}    ${get_status_code}
    RETURN    ${response}

Create New Todo
    [Arguments]    ${title}    ${completed}    ${userId}
    # Create API Session
    &{data}    Create Dictionary    title=${title}    completed=${completed}    userId=${userId}
    ${response}    POST On Session    ${SESSION}    ${todos_endpoint}    json=${data}
    Should Be Equal As Integers    ${response.status_code}    ${post_status_code}
    RETURN    ${response}

Update Existing Todo
    [Arguments]    ${todo_id}    ${title}    ${completed}    ${userId}
    # Create API Session
    &{data}    Create Dictionary    id=${todo_id}    title=${title}    completed=${completed}    userId=${userId}
    ${response}    PUT On Session    ${SESSION}    ${todos_endpoint}/${todo_id}    ${data}
    Should Be Equal As Integers    ${response.status_code}    ${put_status_code}
    RETURN    ${response}

Patch Title of Todo
    [Arguments]    ${todo_id}    ${title}
    # Create API Session
    &{data}    Create Dictionary    title=${title}
    ${response}    PATCH On Session    ${SESSION}    ${todos_endpoint}/${todo_id}    ${data}
    Should Be Equal As Integers    ${response.status_code}    ${patch_status_code}
    RETURN    ${response}

Delete A Todo
    [Arguments]    ${todo_id}
    # Create API Session
    ${response}    DELETE On Session    ${SESSION}    ${todos_endpoint}/${todo_id}
    Should Be Equal As Integers    ${response.status_code}    ${delete_status_code}
    RETURN    ${response}
