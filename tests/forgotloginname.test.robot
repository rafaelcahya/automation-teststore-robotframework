*** Settings ***
Resource    ../pages/forgotloginname_page.robot
Library    ../EnvLoader.py
Library    String

Test Setup    Open forgot loginname page
Test Teardown    Close Browser

*** Test Cases ***
Validate last name is empty
    [Tags]    forgotloginname    regression    authentication
    ${STRING_VALUE}    Generate Random String
    Fill last name in forgot loginname page    ${EMPTY}
	Fill email in forgot loginname page    ${STRING_VALUE}@com.com
	Click continue button
	Verify last name is empty

Validate email is empty
    [Tags]    forgotloginname    regression    authentication
    ${STRING_VALUE}    Generate Random String
	Fill email in forgot loginname page    ${EMPTY}
    Fill last name in forgot loginname page    ${STRING_VALUE}
	Click continue button
	Verify email is empty

Validate email is in invalid format
    [Tags]    forgotloginname    regression    authentication
    ${STRING_VALUE}    Generate Random String
    Fill last name in forgot loginname page    ${STRING_VALUE}
	Fill email in forgot loginname page    ${STRING_VALUE}
	Click continue button
	Verify email is in invalid format

Validate last name and email are empty
    [Tags]    forgotloginname    regression    authentication
    Fill last name in forgot loginname page    ${EMPTY}
	Fill email in forgot loginname page    ${EMPTY}
	Click continue button
	Verify last name and email are empty

Validate last name and email are not registered
    [Tags]    forgotloginname    regression    authentication
    ${STRING_VALUE}    Generate Random String
    Fill last name in forgot loginname page    ${STRING_VALUE}
	Fill email in forgot loginname page    ${STRING_VALUE}@com.com
	Click continue button
	Verify login name and email are not registered

Validate last name and email are valid
    [Tags]    forgotloginname    regression    authentication
    ${LASTNAME_VALUE}    Get Env    LASTNAME_VALUE 
    ${EMAIL_VALUE}    Get Env    EMAIL_VALUE 
    Fill last name in forgot loginname page    ${LASTNAME_VALUE}
	Fill email in forgot loginname page    ${EMAIL_VALUE}
	Click continue button
	Verify success request forgot loginname