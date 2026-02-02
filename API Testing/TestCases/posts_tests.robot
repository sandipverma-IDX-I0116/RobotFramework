*** Settings ***
Resource    ../Resources/posts_keywords.resource

*** Variables ***
${get_post_id}    1

${create_post_title}    This is Robot Framework Test Post
${create_post_body}     This is an example body for the post
${create_post_userId}   10

${update_post_id}     1
${update_post_title}  This is Updated Title
${update_post_body}   This is the Updated Body for the post
${update_post_userId}     10

${patch_post_id}    1
${patch_post_title}   This is Partially Updated Title

${delete_post_id}   1



*** Test Cases ***

Get All Posts
    ${response}    Get All Posts
    Log To Console    ${response.json()}

Get Single Post
    ${response}    Get Single Post    ${get_post_id}
    Log To Console    ${response.json()}

Create New Post
    ${response}    Create New Post    ${create_post_title}    ${create_post_body}    ${create_post_userId}
    Log To Console    ${response.json()}

Update Existing Post
    ${response}    Update Existing Post    ${update_post_id}    ${update_post_title}    ${update_post_body}    ${update_post_userId}
    Log To Console    ${response.json()}

Patch Title of Post
    ${response}    Patch Title of Post    ${patch_post_id}    ${patch_post_title}
    Log To Console    ${response.json()}

Delete A Post
    ${response}    Delete A Post    ${delete_post_id}
    Log To Console    ${response.json()}
    Log To Console    Deleted Status = ${response.status_code}