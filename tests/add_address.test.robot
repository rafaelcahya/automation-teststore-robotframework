*** Settings ***
Resource    ../helper/generate_text.robot
Resource    ../pages/address_page.robot
Resource    ../pages/signin_page.robot
Library    ../EnvLoader.py

Test Setup    Login to Store
Test Teardown    Close Browser

*** Test Cases ***
Verify add new address
    [Tags]    ADDRESS    REGRESSION
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