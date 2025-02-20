*** Settings ***
Library    SeleniumLibrary
Library    ../EnvLoader.py

*** Variables ***
${ADD_ADDRESS_PAGE}    class:account-address-insert
${ADDRESS_BUTTON}    xpath=//a[@data-original-title='Manage Address Book']
${NEW_ADDRESS_BUTTON}    xpath=//a[@title='New Address']
${FIRSTNAME_FIELD}    id:AddressFrm_firstname
${LASTNAME_FIELD}    id:AddressFrm_lastname
${COMPANY_FIELD}    id:AddressFrm_company
${FIRSTADDRESS_FIELD}    id:AddressFrm_address_1
${SECONDADDRESS_FIELD}    id:AddressFrm_address_2
${CITY_FIELD}    id:AddressFrm_city
${ZONE_FIELD}    id:AddressFrm_zone_id
${ZIPCODE_FIELD}    id:AddressFrm_postcode
${COUNTRY_FIELD}    id:AddressFrm_country_id
${DEFAULTADDRESS_BUTTON}    id:AddressFrm_default0
${CONTINUE_BUTTON}    xpath=//button[@title='Continue']
${ALERTSUCCESS}    xpath=//div[contains(@class, 'alert-success')]

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

Verify success add address
    Wait Until Element Is Visible    ${ALERTSUCCESS}    2s
    Element Should Contain    ${ALERTSUCCESS}    Your address has been successfully inserted