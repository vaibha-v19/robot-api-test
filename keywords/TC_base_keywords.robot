*** Settings ***
Library    RequestsLibrary
Library    Collections
Variables       ../data/TC_base_variables.py

*** Keywords ***
Launch session
    ${credentials}=    Set Variable    ${username}:${password}

    # Perform a GET request with basic authentication
    ${encoded}=    Evaluate    str(base64.b64encode('${credentials}'.encode('utf-8')), 'utf-8')    modules=base64
    ${headers}=    Create Dictionary    Content-Type=application/json
    Set To Dictionary    ${headers}    Authorization=Basic ${encoded}
    Create Session    mySession    ${base_url}  headers=${headers}  verify=False

Get response and validate
    ${response}=    GET On Session    mySession    ${base_url}

    # Check if the status code is 200 (OK)
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal As Strings    ${status_code}    200
    Log To Console    Status Code: ${status_code}

    # Log and verify the response body
    ${body}=    Convert To String    ${response.content}
    Log To Console    Response Body: ${body}