*** Settings ***
Resource    ../pages/signup_page.robot
Resource    ../helper/generate_text.robot

Test Setup    Open Signup Page
Test Teardown    Close Browser
Library    ../EnvLoader.py
Library    String

*** Test Cases ***
Validate successfully Signup with valid data
    [Tags]    signup    regression    authentication
    ${STRING_VALUE}    Generate Random String
	${NUMBER_VALUE}    Generate Random Number

	Fill firstname field   ${STRING_VALUE} 
	Fill lastname field    ${STRING_VALUE}
	Fill email field    ${STRING_VALUE}@test.com
	Fill telephone field    ${NUMBER_VALUE}
	Fill fax field    ${NUMBER_VALUE}
	Fill company field    ${STRING_VALUE}
	Fill first address field    ${STRING_VALUE}
	Fill second address field    ${STRING_VALUE}
	Fill city field    ${STRING_VALUE}
	Select country
	Fill zipcode field    ${NUMBER_VALUE}
	Select zone
	Fill login name field    ${STRING_VALUE}
	Fill password field    ${STRING_VALUE}
	Fill confirm password field    ${STRING_VALUE}
	Select subscribe yes
	Select privacy policy
	Click continue button
	Verify signup confirmation message

Validate empty first name
    [Tags]    signup    regression    authentication
    Fill firstname field    ${EMPTY}
	Click continue button
	Verify message for empty first name

Validate empty last name
    [Tags]    signup    regression    authentication
    Fill lastname field    ${EMPTY}
	Click continue button
	Verify message for empty last name

Validate empty email
    [Tags]    signup    regression    authentication
    Fill email field    ${EMPTY}
	Click continue button
	Verify message for empty email

Validate empty first address
    [Tags]    signup    regression    authentication
    Fill first address field    ${EMPTY}
	Click continue button
	Verify message for empty first address

Validate empty city
    [Tags]    signup    regression    authentication
    Fill city field    ${EMPTY}
	Click continue button
	Verify message for empty city

Validate empty zip code
    [Tags]    signup    regression    authentication
    Fill zipcode field    ${EMPTY}
	Click continue button
	Verify message for empty zip code

Validate empty login name
    [Tags]    signup    regression    authentication
    Fill login name field    ${EMPTY}
	Click continue button
	Verify message for empty login name

Validate empty password
    [Tags]    signup    regression    authentication
    Fill password field    ${EMPTY}
	Click continue button
	Verify message for empty password

Validate password is not same with confirm password
    [Tags]    signup    regression    authentication
    ${STRING_VALUE}    Generate Random String
	${NUMBER_VALUE}    Generate Random Number

	Fill firstname field   ${STRING_VALUE} 
	Fill lastname field    ${STRING_VALUE}
	Fill email field    ${STRING_VALUE}@test.com
	Fill telephone field    ${NUMBER_VALUE}
	Fill fax field    ${NUMBER_VALUE}
	Fill company field    ${STRING_VALUE}
	Fill first address field    ${STRING_VALUE}
	Fill second address field    ${STRING_VALUE}
	Fill city field    ${STRING_VALUE}
	Select country
	Fill zipcode field    ${NUMBER_VALUE}
	Select zone
	Fill login name field    ${STRING_VALUE}
	Fill password field    test123
	Fill confirm password field    testtest
	Select subscribe yes
	Select privacy policy
	Click continue button
	Verify password is not same with confirm password

Validate signup with registered email
    [Tags]    signup    regression    authentication
    ${STRING_VALUE}    Generate Random String
	${NUMBER_VALUE}    Generate Random Number
	${EMAIL_VALUE}    Get Env    EMAIL_VALUE

	Fill firstname field   ${STRING_VALUE} 
	Fill lastname field    ${STRING_VALUE}
	Fill email field    ${EMAIL_VALUE}
	Fill telephone field    ${NUMBER_VALUE}
	Fill fax field    ${NUMBER_VALUE}
	Fill company field    ${STRING_VALUE}
	Fill first address field    ${STRING_VALUE}
	Fill second address field    ${STRING_VALUE}
	Fill city field    ${STRING_VALUE}
	Select country
	Fill zipcode field    ${NUMBER_VALUE}
	Select zone
	Fill login name field    ${STRING_VALUE}
	Fill password field    ${STRING_VALUE}
	Fill confirm password field    ${STRING_VALUE}
	Select subscribe yes
	Select privacy policy
	Click continue button
	Verify signup with registered email