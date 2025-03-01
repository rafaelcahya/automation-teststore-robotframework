*** Settings ***
Resource    ../pages/forgotpassword_page.robot
Library    ../EnvLoader.py
Library    String

Test Setup    Open forgot password page
Test Teardown    Close Browser

*** Test Cases ***
Validate login name and email are empty
    [Tags]    forgotpassword    regression    authentication
    Fill login name in forgot password page    ${EMPTY}
	Fill email in forgot password page    ${EMPTY}
	Click continue button
	Verify login name and email are empty

Validate login name and email are not registered
    [Tags]    forgotpassword    regression    authentication
    ${STRING_VALUE}    Generate Random String
    Fill login name in forgot password page    ${STRING_VALUE}
	Fill email in forgot password page    ${STRING_VALUE}@com.com
	Click continue button
	Verify login name and email are not registered

Validate login name and email are valid
    [Tags]    forgotpassword    regression    authentication
    ${LOGINNAME_VALUE}    Get Env    LOGINNAME_VALUE 
    ${EMAIL_VALUE}    Get Env    EMAIL_VALUE 
    Fill login name in forgot password page    ${LOGINNAME_VALUE}
	Fill email in forgot password page    ${EMAIL_VALUE}
	Click continue button
	Verify success request forgot password