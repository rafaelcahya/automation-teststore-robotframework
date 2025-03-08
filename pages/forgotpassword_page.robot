*** Settings ***
Library    SeleniumLibrary
Library    ../EnvLoader.py
Resource    ../variables/forgotpassword_locators.robot

*** Keywords ***
Open forgot password page
    ${STORE_BASE_URL}    Get Env    STORE_BASE_URL
    ${LOGIN_URL}    Get Env    LOGIN_URL
    Open Browser  ${STORE_BASE_URL}${LOGIN_URL}    ${BROWSER}
    Wait Until Location Is    ${STORE_BASE_URL}${LOGIN_URL}    2s
	Click forgot password button
    Maximize Browser Window

Click forgot password button
    Wait Until Element Is Visible    ${FORGOTPASSWORD_BUTTON}
	Click Element    ${FORGOTPASSWORD_BUTTON}

Fill login name in forgot password page
    [Arguments]    ${LOGINNAME_VALUE}
    Wait Until Element Is Visible    ${LOGINNAME_FIELD}
	Input Text    ${LOGINNAME_FIELD}    ${LOGINNAME_VALUE}

Fill email in forgot password page
    [Arguments]    ${EMAIL_VALUE}
    Wait Until Element Is Visible    ${EMAIL_FIELD}
	Input Text    ${EMAIL_FIELD}    ${EMAIL_VALUE}

Click continue button
    Wait Until Element Is Visible    ${CONTINUE_BUTTON}
	Click Button    ${CONTINUE_BUTTON}

Verify login name is empty
    Element Should Be Visible    ${ALERTBOX}
    Element Should Contain    ${ALERTBOX}    The Login name was not provided or not found in our records, please try again!

Verify email is empty
    Element Should Be Visible    ${ALERTBOX}
    Element Should Contain    ${ALERTBOX}    The Email address was not provided or not found in our records, please try again!

Verify email is in invalid format
    Element Should Be Visible    ${ALERTBOX}
    Element Should Contain    ${ALERTBOX}    No records found matching information your provided, please check your information and try again!

Verify login name and email are empty
    Element Should Be Visible    ${ALERTBOX}
    Element Should Contain    ${ALERTBOX}    The Email address was not provided or not found in our records, please try again!

Verify login name and email are not registered
    Element Should Be Visible    ${ALERTBOX}
	Element Should Contain    ${ALERTBOX}    No records found matching information your provided, please check your information and try again!

Verify success request forgot password
    Element Should Be Visible    ${ALERTSUCCESS}
	Element Should Contain    ${ALERTSUCCESS}    Success: Password reset link has been sent to your e-mail address.
