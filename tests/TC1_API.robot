*** Settings ***
Library    RequestsLibrary
Resource    ../keywords/TC1_keywords.robot

* Test Cases ***
Delete Request
    Launch Session
    ${body}=    Create Dictionary   name=pawan      job=engineer
    Call and validate delete request    ${body}

Post Request
    Launch Session
    ${body}=    Create Dictionary   name=pawan      job=trainer
    Call and validate post request       ${body}

Get Request
    Launch Session
    ${response}=    Call and validate get request status
    Validate headers    ${response}
    Validate cookies    ${response}
Put Request
    Launch Session

    ${body}=    Create Dictionary   name=pawan      job=engineer
    Call and validate put request       ${body}
