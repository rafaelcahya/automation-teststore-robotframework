*** Settings ***
Library    SeleniumLibrary
Library    ../EnvLoader.py
Resource    ../variables/signin_locators.robot

*** Keywords ***
Open signin page
    ${STORE_BASE_URL}    Get Env    STORE_BASE_URL
    ${LOGIN_URL}    Get Env    LOGIN_URL
    Open Browser  ${STORE_BASE_URL}${LOGIN_URL}    ${BROWSER}
    Wait Until Location Is    ${STORE_BASE_URL}${LOGIN_URL}    2s
    Maximize Browser Window

Fill login name field in login page
    [Arguments]    ${EMAIL_VALUE}
    Element Should Be Visible    ${LOGINNAME_FIELD}
    Input Text    ${LOGINNAME_FIELD}    ${EMAIL_VALUE}

Fill password field in login page
    [Arguments]    ${PASSWORD_VALUE}
    Element Should Be Visible    ${PASSWORD_FIELD}
    Input Text    ${PASSWORD_FIELD}    ${PASSWORD_VALUE}

Click login button
    Element Should Be Visible    ${PASSWORD_FIELD}
    Click Button    ${LOGIN_BUTTON}

Verify login with valid account
    ${STORE_BASE_URL}    Get Env    STORE_BASE_URL
    ${ACCOUNT_URL}    Get Env    ACCOUNT_URL
    Wait Until Location Is    ${STORE_BASE_URL}${ACCOUNT_URL}
    Location Should Be    ${STORE_BASE_URL}${ACCOUNT_URL}

Verify login with invalid account
    Element Should Be Visible    ${ALERTBOX}
    Element Should Contain   ${ALERTBOX}    Incorrect login or password provided.

Login to Store
    ${LOGINNAME}    Get Env    LOGINNAME_VALUE
    ${PASSWORD}    Get Env    PASSWORD_VALUE
    Open signin page
	Fill login name field in login page    ${LOGINNAME}
	Fill password field in login page    ${PASSWORD}
	Click login button