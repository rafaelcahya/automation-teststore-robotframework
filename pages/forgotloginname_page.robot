*** Settings ***
Library    SeleniumLibrary
Library    ../EnvLoader.py
Resource    ../variables/forgotloginname_locators.robot

*** Keywords ***
Open forgot loginname page
    ${STORE_BASE_URL}    Get Env    STORE_BASE_URL
    ${LOGIN_URL}    Get Env    LOGIN_URL
    Open Browser  ${STORE_BASE_URL}${LOGIN_URL}    ${BROWSER}
    Wait Until Location Is    ${STORE_BASE_URL}${LOGIN_URL}    2s
	Click forgot loginname button
    Maximize Browser Window

Click forgot loginname button
    Wait Until Element Is Visible    ${FORGOTLOGINNAME_BUTTON}
	Click Element    ${FORGOTLOGINNAME_BUTTON}

Fill last name in forgot loginname page
    [Arguments]    ${LASTNAME_VALUE}
    Wait Until Element Is Visible    ${LASTNAME_FIELD}
	Input Text    ${LASTNAME_FIELD}    ${LASTNAME_VALUE}

Fill email in forgot loginname page
    [Arguments]    ${EMAIL_VALUE}
    Wait Until Element Is Visible    ${EMAIL_FIELD}
	Input Text    ${EMAIL_FIELD}    ${EMAIL_VALUE}

Click continue button
    Wait Until Element Is Visible    ${CONTINUE_BUTTON}
	Click Button    ${CONTINUE_BUTTON}

Verify login name and email are empty
    Element Should Be Visible    ${ALERTBOX}
    Element Should Contain    ${ALERTBOX}    The Email address was not provided or not found in our records, please try again!

Verify login name and email are not registered
    Element Should Be Visible    ${ALERTBOX}
	Element Should Contain    ${ALERTBOX}    No records found matching information your provided, please check your information and try again!

Verify success request forgot loginname
    Element Should Be Visible    ${ALERTSUCCESS}
	Element Should Contain    ${ALERTSUCCESS}    Success: Your login name reminder has been sent to your e-mail address.
