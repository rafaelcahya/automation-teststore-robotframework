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
	Select zone
	Fill zipcode field    ${NUMBER_VALUE}
	Fill login name field    ${STRING_VALUE}
	Fill password field    ${STRING_VALUE}
	Fill confirm password field    ${STRING_VALUE}
	Select subscribe yes
	Select privacy policy
	Click continue button
	Verify signup confirmation message

Validate first name is more than 32 characters
    [Tags]    signup    regression    authentication
	${STRING_VALUE32}    Get Env    STRING_VALUE32
    Fill firstname field    ${STRING_VALUE32}
	Click continue button
	Verify message for character limit in first name 

Validate first name is less than 1 characters
    [Tags]    signup    regression    authentication
    Fill firstname field    ${EMPTY}
	Click continue button
	Verify message for character limit in first name 

Validate last name is more than 32 characters
    [Tags]    signup    regression    authentication
	${STRING_VALUE32}    Get Env    STRING_VALUE32
    Fill lastname field    ${STRING_VALUE32}
	Click continue button
	Verify message for character limit in first name 

Validate last name is less than 1 characters
    [Tags]    signup    regression    authentication
    Fill lastname field    ${EMPTY}
	Click continue button
	Verify message for character limit in last name 

Validate invalid email format
    [Tags]    signup    regression    authentication
    ${STRING_VALUE}    Generate Random String
    Fill email field    ${STRING_VALUE}
	Click continue button
	Verify message for invalid email format

Validate empty email
    [Tags]    signup    regression    authentication
    Fill email field    ${EMPTY}
	Click continue button
	Verify message for empty email

Validate first address is more than 128 characters
    [Tags]    signup    regression    authentication$
    ${STRING_VALUE132}    Get Env    STRING_VALUE132
    Fill first address field    ${STRING_VALUE132}
	Click continue button
	Verify message for character limit in first address

Validate first address is less than 1 character
    [Tags]    signup    regression    authentication
    Fill first address field    ${EMPTY}
	Click continue button
	Verify message for character limit in first address

Validate city is less than 3 characters
    [Tags]    signup    regression    authentication
    Fill city field    ${EMPTY}
	Click continue button
	Verify message for character limit in city

Validate city is more than 128 characters
    [Tags]    signup    regression    authentication
    ${STRING_VALUE132}    Get Env    STRING_VALUE132
    Fill city field    ${STRING_VALUE132}
	Click continue button
	Verify message for character limit in city

Validate empty city
    [Tags]    signup    regression    authentication
    Fill city field    ${EMPTY}
	Click continue button
	Verify message for character limit in city

Validate empty region
    [Tags]    signup    regression    authentication
	Click continue button
	Verify message for empty region

Validate zip code is less than 3 characters
    [Tags]    signup    regression    authentication
	${INT_VALUE2}    Get Env    INT_VALUE2
    Fill zipcode field    ${INT_VALUE2}
	Click continue button
	Verify message for empty zip code

Validate login name is more than 64 characters
    [Tags]    signup    regression    authentication
    ${STRING_VALUE132}    Get Env    STRING_VALUE132
    Fill login name field    ${STRING_VALUE132}
	Click continue button
	Verify message for empty login name

Validate login name is less than 5 characters
    [Tags]    signup    regression    authentication
    ${STRING_VALUE2}    Get Env    STRING_VALUE2
    Fill login name field    ${STRING_VALUE2}
	Click continue button
	Verify message for empty login name

Validate fill the login name with registered login name
    [Tags]    signup    regression    authentication
    ${STRING_VALUE}    Generate Random String
	${NUMBER_VALUE}    Generate Random Number
    ${LOGINNAME_VALUE}    Get Env    LOGINNAME_VALUE

	Fill firstname field   ${STRING_VALUE} 
	Fill lastname field    ${STRING_VALUE}
	Fill email field    ${STRING_VALUE}@test.com
	Fill telephone field    ${NUMBER_VALUE}
	Fill fax field    ${NUMBER_VALUE}
	Fill company field    ${STRING_VALUE}
	Fill first address field    ${STRING_VALUE}
	Fill second address field    ${STRING_VALUE}
	Fill city field    ${STRING_VALUE}
	Fill zipcode field    ${NUMBER_VALUE}
	Select zone
	Fill login name field    ${LOGINNAME_VALUE}
	Fill password field    ${STRING_VALUE}
	Fill confirm password field    ${STRING_VALUE}
	Select subscribe yes
	Select privacy policy
	Click continue button
	Verify message for duplicate login name

Validate password is less than 3 characters
    [Tags]    signup    regression    authentication
    ${STRING_VALUE2}    Get Env    STRING_VALUE2
    Fill password field    ${STRING_VALUE2}
	Click continue button
	Verify message for character limit in password

Validate password is more than 20 characters
    [Tags]    signup    regression    authentication
	${STRING_VALUE32}    Get Env    STRING_VALUE32
    Fill password field    ${STRING_VALUE32}
	Click continue button
	Verify message for character limit in password

Validate empty password
    [Tags]    signup    regression    authentication
    Fill password field    ${EMPTY}
	Click continue button
	Verify message for character limit in password

Validate privacy policy is not selected
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
	Select zone
	Fill zipcode field    ${NUMBER_VALUE}
	Fill login name field    ${STRING_VALUE}
	Fill password field    ${STRING_VALUE}
	Fill confirm password field    ${STRING_VALUE}
	Select subscribe yes
	Click continue button
	Verify message for privacy policy is not selected

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
	Fill zipcode field    ${NUMBER_VALUE}
	Select zone
	Fill login name field    ${STRING_VALUE}
	Fill password field    ${STRING_VALUE}
	Fill confirm password field    ${STRING_VALUE}
	Select subscribe yes
	Select privacy policy
	Click continue button
	Verify signup with registered email