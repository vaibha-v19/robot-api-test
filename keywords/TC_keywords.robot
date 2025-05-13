*** Settings ***
Library    RequestsLibrary
Library    Collections
Variables       ../data/TC_variables.py
Library    ../resources/AzureADAuthentication.py


*** keywords ***
#azure ad
Get auth token
    ${auth}=    AzureADAuthentication    ${tenant_id}    ${client_id}    ${client_secret}
    ${token}=    Get Access Token    ${auth}
    RETURN      ${token}
Launch session and validate
    [Arguments]     ${token}
    Create Session    mySession    ${base_url}    headers={"Authorization": "Bearer ${token}"}
    ${response}=    Get Request    mySession    /me
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200
    Log To Console    ${response.json()}

