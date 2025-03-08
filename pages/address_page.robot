*** Settings ***
Library    SeleniumLibrary
Library    ../EnvLoader.py
Resource    ../variables/addaddress_locators.robot

*** Keywords ***
Click address button
    Wait Until Element Is Visible    ${ADDRESS_BUTTON}
	Click Element    ${ADDRESS_BUTTON}

Click new address button
    Wait Until Element Is Visible    ${NEW_ADDRESS_BUTTON}
	Click Element    ${NEW_ADDRESS_BUTTON}

Fill firstname field in address page
    [Arguments]    ${FIRSTNAME_VALUE}
	Wait Until Element Is Visible    ${FIRSTNAME_FIELD}    2s
	Input Text    ${FIRSTNAME_FIELD}    ${FIRSTNAME_VALUE}

Fill lastname field in address page
    [Arguments]    ${LASTNAME_VALUE}
	Wait Until Element Is Visible    ${LASTNAME_FIELD}    2s
	Input Text    ${LASTNAME_FIELD}    ${LASTNAME_VALUE}

Fill company field in address page
    [Arguments]    ${COMPANY_VALUE}
	Wait Until Element Is Visible    ${COMPANY_FIELD}    2s
	Input Text    ${COMPANY_FIELD}    ${COMPANY_VALUE}

Fill first address field in address page
    [Arguments]    ${FIRSTADDRESS_VALUE}
	Wait Until Element Is Visible    ${FIRSTADDRESS_FIELD}    2s
	Input Text    ${FIRSTADDRESS_FIELD}    ${FIRSTADDRESS_VALUE}

Fill second address field in address page
    [Arguments]    ${SECONDADDRESS_VALUE}
	Wait Until Element Is Visible    ${SECONDADDRESS_FIELD}    2s
	Input Text    ${SECONDADDRESS_FIELD}    ${SECONDADDRESS_VALUE}

Fill city field in address page
    [Arguments]    ${CITYVALUE}
	Wait Until Element Is Visible    ${CITY_FIELD}    2s
	Input Text    ${CITY_FIELD}    ${CITYVALUE}

Select zone in address page
    Wait Until Element Is Visible    ${ZONE_FIELD}    5s
    ${options}=    Get WebElements    xpath=//select[@id='AddressFrm_zone_id']/option[not(@value='FALSE')]
    ${random_option}=    Evaluate    random.choice($options)    random
    ${random_value}=    Get Element Attribute    ${random_option}    value
    Select From List By Value    ${ZONE_FIELD}     ${random_value}

Fill zipcode field in address page
    [Arguments]    ${ZIPCODE_VALUE}
	Wait Until Element Is Visible    ${ZIPCODE_FIELD}    2s
	Input Text    ${ZIPCODE_FIELD}    ${ZIPCODE_VALUE}
    
Select country in address page
    Wait Until Element Is Visible    ${COUNTRY_FIELD}    5s
    ${options}=    Get WebElements    xpath=//select[@id='AddressFrm_country_id']/option[not(@value='FALSE')]
    ${random_option}=    Evaluate    random.choice($options)    random
    ${random_value}=    Get Element Attribute    ${random_option}    value
    Select From List By Value    ${COUNTRY_FIELD}     ${random_value}
    Sleep    1s

Select default address in address page
	Wait Until Element Is Visible    ${DEFAULTADDRESS_BUTTON}    2s
	Click Element    ${DEFAULTADDRESS_BUTTON}

Click continue button in address page
    Wait Until Element Is Visible    ${CONTINUE_BUTTON}    2s
	Click Element    ${CONTINUE_BUTTON}

Verify character limit for first name
    Element Should Be Visible    ${MAXCHAR_FIRSTNAME_MESSAGE}
    Element Should Contain    ${MAXCHAR_FIRSTNAME_MESSAGE}    First Name must be between 1 and 32 characters!

Verify character limit for last name
    Element Should Be Visible    ${MAXCHAR_LASTTNAME_MESSAGE}
    Element Should Contain    ${MAXCHAR_LASTTNAME_MESSAGE}    Last Name must be between 1 and 32 characters!

Verify character limit for first address
    Element Should Be Visible    ${MAXCHAR_FIRSTADDRESS_MESSAGE}
    Element Should Contain    ${MAXCHAR_FIRSTADDRESS_MESSAGE}    Address must be between 3 and 128 characters!

Verify character limit for city
    Element Should Be Visible    ${MAXCHAR_CITY_MESSAGE}
    Element Should Contain    ${MAXCHAR_CITY_MESSAGE}    City must be between 3 and 128 characters!

Verify region is empty
    Element Should Be Visible    ${EMPTY_REGION_MESSAGE}
    Element Should Contain    ${EMPTY_REGION_MESSAGE}    Please select a region / state!

Verify character limit for zip code
    Element Should Be Visible    ${MAXCHAR_ZIPCODE_MESSAGE}
    Element Should Contain    ${MAXCHAR_ZIPCODE_MESSAGE}    Zip/postal code must be between 2 and 10 characters!

Verify success add address
    Wait Until Element Is Visible    ${ALERTSUCCESS}    2s
    Element Should Contain    ${ALERTSUCCESS}    Your address has been successfully inserted