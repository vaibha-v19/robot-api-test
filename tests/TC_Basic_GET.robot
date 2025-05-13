*** Settings ***
Library    RequestsLibrary
Resource    ../keywords/TC_base_keywords.robot

*** Test Cases ***
Get Info With Basic Auth
    # Create a session with the base URL
    Launch session
    Get response and validate
