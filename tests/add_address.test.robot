*** Settings ***
Resource    ../helper/generate_text.robot
Resource    ../pages/address_page.robot
Resource    ../pages/signin_page.robot
Library    ../EnvLoader.py

Test Setup    Login to Store
Test Teardown    Close Browser

*** Test Cases ***
Validate first name is less than 1 character
    [Tags]    address    regression
    Click address button
    Click new address button
	Fill firstname field in address page   ${EMPTY} 
	Click continue button in address page
	Verify character limit for first name

Validate first name is more than 32 characters
    [Tags]    address    regression
	${STRING_VALUE32}    Get Env    STRING_VALUE32
    Click address button
    Click new address button
	Fill firstname field in address page   ${STRING_VALUE32} 
	Click continue button in address page
	Verify character limit for first name

Validate last name is less than 1 character
    [Tags]    address    regression
    Click address button
    Click new address button
	Fill lastname field in address page    ${EMPTY}
	Click continue button in address page
	Verify character limit for last name

Validate last name is more than 32 characters
    [Tags]    address    regression
	${STRING_VALUE32}    Get Env    STRING_VALUE32
    Click address button
    Click new address button
	Fill lastname field in address page    ${STRING_VALUE32}
	Click continue button in address page
	Verify character limit for last name

Validate first address is less than 3 character
    [Tags]    address    regression
    Click address button
    Click new address button
	Fill first address field in address page    ${EMPTY}
	Click continue button in address page
	Verify character limit for first address

Validate first address is more than 128 character
    [Tags]    address    regression
	${STRING_VALUE132}    Get Env    STRING_VALUE132
    Click address button
    Click new address button
	Fill first address field in address page    ${STRING_VALUE132}
	Click continue button in address page
	Verify character limit for first address

Validate city is less than 3 character
    [Tags]    address    regression
	${STRING_VALUE2}    Get Env    STRING_VALUE2
    Click address button
    Click new address button
	Fill city field in address page    ${STRING_VALUE2}
	Click continue button in address page
	Verify character limit for city

Validate city is more than 128 character
    [Tags]    address    regression
	${STRING_VALUE132}    Get Env    STRING_VALUE132
    Click address button
    Click new address button
	Fill city field in address page    ${STRING_VALUE132}
	Click continue button in address page
	Verify character limit for city

Validate region is not selected
    [Tags]    address    regression
    Click address button
    Click new address button
	Click continue button in address page
	Verify region is empty

Validate zip code is less than 2 character
    [Tags]    address    regression
    Click address button
    Click new address button
	Fill zipcode field in address page    ${EMPTY}
	Click continue button in address page
	Verify character limit for zip code

Validate zip code is more than 10 character
    [Tags]    address    regression
	${STRING_VALUE32}    Get Env    STRING_VALUE32
    Click address button
    Click new address button
	Fill zipcode field in address page    ${STRING_VALUE32}
	Click continue button in address page
	Verify character limit for zip code

Verify add new address
    [Tags]    address    regression
    ${STRING_VALUE}    Generate Random String
	${NUMBER_VALUE}    Generate Random Number
    Click address button
    Click new address button
	Fill firstname field in address page   ${STRING_VALUE} 
	Fill lastname field in address page    ${STRING_VALUE}
	Fill company field in address page    ${STRING_VALUE}
	Fill first address field in address page    ${STRING_VALUE}
	Fill second address field in address page    ${STRING_VALUE}
	Fill city field in address page    ${STRING_VALUE}
	Select country in address page
	Fill zipcode field in address page    ${NUMBER_VALUE}
	Select zone in address page
	Select default address in address page
	Click continue button in address page
	Verify success add address