*** Settings ***
Library    RequestsLibrary
Library    Collections
Variables       ../data/TC_oauth_variables.py

*** Keywords ***
Launch session
    &{headers}=    Create Dictionary    Authorization=token ${access_token}
    Create Session    mySession    ${base_url}    headers=${headers}

Get response and validate
    ${response}=    Get Request    mySession    ${endpoint}

    ${status_code}=     convert to string   ${response.status_code}
    Should Be Equal    ${status_code}    200
    Log To Console    Status Code: ${status_code}