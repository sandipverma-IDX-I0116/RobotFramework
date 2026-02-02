*** Settings ***
Resource    ../Resources/todos_keywords.resource

Test Setup    Create API Session
Test Teardown    Close API Session

*** Variables ***
${get_todo_id}    1

${create_todo_title}    This is Robot Framework Test Todo
${create_todo_completed}    False
${create_todo_userId}   10

${update_todo_id}     1
${update_todo_title}  This is Updated Todo Title
${update_todo_completed}   True
${update_todo_userId}     10

${patch_todo_id}    1
${patch_todo_title}   This is Partially Updated Todo Title

${delete_todo_id}   1


*** Test Cases ***
Get All Todos
    ${response}    Get All Todos
    Log To Console    ${response.json()}

Get Single Todo
    ${response}    Get Single Todo    ${get_todo_id}
    Log To Console    ${response.json()}

Create New Todo
    ${response}    Create New Todo    ${create_todo_title}    ${create_todo_completed}    ${create_todo_userId}
    Log To Console    ${response.json()}

Update Existing Todo
    ${response}    Update Existing Todo    ${update_todo_id}    ${update_todo_title}    ${update_todo_completed}    ${update_todo_userId}
    Log To Console    ${response.json()}

Patch Title of Todo
    ${response}    Patch Title of Todo    ${patch_todo_id}    ${patch_todo_title}
    Log To Console    ${response.json()}

Delete A Todo
    ${response}    Delete A Todo    ${delete_todo_id}
    Log To Console    ${response.json()}
    Log To Console    Deleted Status = ${response.status_code}
