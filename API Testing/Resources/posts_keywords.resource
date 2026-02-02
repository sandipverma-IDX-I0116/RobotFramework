*** Settings  ***
Library    SeleniumLibrary
Library    RequestsLibrary
Variables     ../environment.py
Variables    ../PageObjects/api_variables.py

*** Keywords ***

Create API Session
    Create Session    ${SESSION}    ${BASE_URL}

Close API Session
    Delete All Sessions

Get All Posts
    # Create API Session
    ${response}    GET On Session    ${SESSION}    ${posts_endpoint}
    Should Be Equal As Integers    ${response.status_code}    ${success_status_code}
    RETURN    ${response}

Get Single Post
    [Arguments]    ${post_id}
    # Create API Session
    ${response}    GET On Session    ${SESSION}    ${posts_endpoint}/${post_id}
    Should Be Equal As Integers    ${response.status_code}    ${success_status_code}
    # Should Be Equal As Strings    ${response.json()}[${p_id}]    ${post_id}
    RETURN    ${response}

Create New Post
    [Arguments]    ${title}    ${body}    ${userId}
    # Create API Session
    &{data}    Create Dictionary    title=${title}    body=${body}    userId=${userId}
    ${response}    POST On Session    ${SESSION}    ${posts_endpoint}    json=${data}
    Should Be Equal As Integers    ${response.status_code}    ${created_status_code}
    RETURN    ${response}

Update Existing Post
    [Arguments]    ${post_id}    ${title}    ${body}    ${userId}
    # Create API Session
    &{data}    Create Dictionary    id=${post_id}    title=${title}    body=${body}    userId=${userId}
    ${response}    PUT On Session    ${SESSION}    ${posts_endpoint}/${post_id}    ${data}
    Should Be Equal As Integers    ${response.status_code}    ${success_status_code}
    RETURN    ${response}

Patch Title of Post
    [Arguments]    ${post_id}    ${title}
    # Create API Session
    &{data}    Create Dictionary    title=${title}
    ${response}    PATCH On Session    ${SESSION}    ${posts_endpoint}/${post_id}    ${data}
    Should Be Equal As Integers    ${response.status_code}    ${success_status_code}
    RETURN    ${response}

Delete A Post
    [Arguments]    ${post_id}
    # Create API Session
    ${response}    DELETE On Session    ${SESSION}    ${posts_endpoint}/${post_id}
    Should Be Equal As Integers    ${response.status_code}    ${success_status_code}
    RETURN    ${response}

