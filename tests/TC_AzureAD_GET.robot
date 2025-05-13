*** Settings ***
Library    ../resources/AzureADAuthentication.py
Library    RequestsLibrary
Resource    ../keywords/TC_keywords.robot


*** Test Cases ***
Get User Info
    ${token}=       Get auth token
    Launch session and validate    $token