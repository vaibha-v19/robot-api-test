*** Settings ***
Library    RequestsLibrary
Library    Collections
Variables       ../data/TC1_variables.py


*** keywords ***
# common
Launch Session
    &{headers}=    Create Dictionary    x-api-key=${api_key}
    Create Session    mySession    ${base_url}    headers=${headers}

#Delete req
Call and validate delete request
    [Arguments]   ${body}
    ${header}=      Create Dictionary   Content-Type=application/json
    ${response}=        Delete Request    mySession    ${endpoint}      data=${body}    headers=${header}
    Log To Console    ${response.status_code}
    ${status_code}      Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    204

#Post Request
Call and validate post request
    [Arguments]   ${body}
    ${headers}=      Create Dictionary   Content-Type=application/json

    ${response}=        Post Request    mySession    ${endpoint}      data=${body}      headers=${headers}


    Log To Console    ${response.status_code}
    Log To Console    ${response.content}

    ${status_code}      Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    201
    ${res_body}=    Convert To String    ${response.content}
    Should Contain    ${res_body}    pawan
    Should Contain    ${res_body}    trainer

#Get Request

Call and validate get request status
    ${response}=    Get Request    mySession    ${endpoint1}

    ${status_code}=     convert to string   ${response.status_code}
    Should Be Equal    ${status_code}    200
    ${body}=    convert to string   ${response.content}
    Should Contain    ${body}    Michael
    Log To Console    Body contains Michael
    RETURN      ${response}
Validate headers
    [ARGUMENTS]     ${response}
    #Headers
    ${content_type_value}=    Get From Dictionary    ${response.headers}    Content-Type
    Log To Console    Content-Type: ${content_type_value}

    Should Be Equal    ${content_type_value}    ${expected_content_type}
Validate cookies
    [ARGUMENTS]     ${response}

    #Cookies
    Log To Console    ${response.cookies}
    Should Be Empty    ${response.cookies}

#Put request
Call and validate put request
    [Arguments]     ${body}
    ${header}=      Create Dictionary   Content-Type=application/json
    ${response}=        Put Request    mySession    ${endpoint}      data=${body}    headers=${header}


    Log To Console    ${response.status_code}
    Log To Console    ${response.content}

    ${status_code}      Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200
    ${res_body}=    Convert To String    ${response.content}
    Should Contain    ${res_body}    pawan
    Should Contain    ${res_body}    engineer