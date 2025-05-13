*** Settings ***
Library    RequestsLibrary
Resource    ../keywords/TC_oauth_keywords.robot


*** Test Cases ***
Get User Info With OAuth
    Launch session
    Get response and validate