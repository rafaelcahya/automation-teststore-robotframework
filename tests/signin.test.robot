*** Settings ***
Resource    ../pages/signin_page.robot
Resource    ../pages/signup_page.robot
Library    ../EnvLoader.py
Library    String

Test Setup    Open Signin Page
Test Teardown    Close Browser

*** Test Cases ***
Validate login with valid account
    [Tags]    SIGNIN    REGRESSION    AUTHENTICATION
    ${LOGINNAME}    Get Env    LOGINNAME_VALUE
    ${PASSWORD}    Get Env    PASSWORD_VALUE

	Fill login name field in login page    ${LOGINNAME}
	Fill password field in login page    ${PASSWORD}
	Click login button
	Verify login with valid account

Validate login with login name and password are empty
    [Tags]    SIGNIN    REGRESSION    AUTHENTICATION
    Fill login name field    ${EMPTY}
	Fill password field    ${EMPTY}
	Click login button
	Verify login with invalid account

Validate login with invalid account
    [Tags]    SIGNIN    REGRESSION    AUTHENTICATION
    ${LOGINNAME}    Get Env    LOGINNAME_VALUE
    ${STRING_VALUE}    Generate Random String

    Fill login name field    ${LOGINNAME}
	Fill password field    ${STRING_VALUE}
	Click login button
	Verify login with invalid account