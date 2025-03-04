*** Settings ***
Library    SeleniumLibrary
Library    ../EnvLoader.py
Resource    ../variables/signup_locators.robot   

*** Keywords ***
Open Signup Page
    ${STORE_BASE_URL}    Get Env    STORE_BASE_URL
    ${LOGIN_URL}    Get Env    LOGIN_URL
    Open Browser  ${STORE_BASE_URL}${LOGIN_URL}    ${BROWSER}
    Wait Until Location Is    ${STORE_BASE_URL}${LOGIN_URL}    2s
    Click register button
    Maximize Browser Window

Click register button
    Wait Until Element Is Visible    ${REGISTER_BUTTON}
    Click Element    ${REGISTER_BUTTON}

Fill firstname field
    [Arguments]    ${FIRSTNAME_VALUE}
	Wait Until Element Is Visible    ${FIRSTNAME_FIELD}    2s
	Input Text    ${FIRSTNAME_FIELD}    ${FIRSTNAME_VALUE}

Fill lastname field
    [Arguments]    ${LASTNAME_VALUE}
	Wait Until Element Is Visible    ${LASTNAME_FIELD}    2s
	Input Text    ${LASTNAME_FIELD}    ${LASTNAME_VALUE}

Fill email field
    [Arguments]    ${EMAIL_VALUE}
	Wait Until Element Is Visible    ${EMAIL_FIELD}    2s
	Input Text    ${EMAIL_FIELD}    ${EMAIL_VALUE}

Fill telephone field
    [Arguments]    ${TELEPHONE_VALUE}
	Wait Until Element Is Visible    ${TELEPHONE_FIELD}    2s
	Input Text    ${TELEPHONE_FIELD}    ${TELEPHONE_VALUE}

Fill fax field
    [Arguments]    ${FAX_VALUE}
	Wait Until Element Is Visible    ${FAX_FIELD}    2s
	Input Text    ${FAX_FIELD}    ${FAX_VALUE}

Fill company field
    [Arguments]    ${COMPANY_VALUE}
	Wait Until Element Is Visible    ${COMPANY_FIELD}    2s
	Input Text    ${COMPANY_FIELD}    ${COMPANY_VALUE}

Fill first address field
    [Arguments]    ${FIRSTADDRESS_VALUE}
	Wait Until Element Is Visible    ${FIRSTADDRESS_FIELD}    2s
	Input Text    ${FIRSTADDRESS_FIELD}    ${FIRSTADDRESS_VALUE}

Fill second address field
    [Arguments]    ${SECONDADDRESS_VALUE}
	Wait Until Element Is Visible    ${SECONDADDRESS_FIELD}    2s
	Input Text    ${SECONDADDRESS_FIELD}    ${SECONDADDRESS_VALUE}

Fill city field
    [Arguments]    ${CITYVALUE}
	Wait Until Element Is Visible    ${CITY_FIELD}    2s
	Input Text    ${CITY_FIELD}    ${CITYVALUE}

Select zone
    Wait Until Element Is Visible    ${ZONE_FIELD}    2s
    ${options}=    Get WebElements    xpath=//select[@id='AccountFrm_zone_id']/option[not(@value='FALSE')]
    ${random_option}=    Evaluate    random.choice($options)    random
    ${random_value}=    Get Element Attribute    ${random_option}    value
    Select From List By Value    ${ZONE_FIELD}     ${random_value}

Fill zipcode field
    [Arguments]    ${ZIPCODE_VALUE}
	Wait Until Element Is Visible    ${ZIPCODE_FIELD}    2s
	Input Text    ${ZIPCODE_FIELD}    ${ZIPCODE_VALUE}
    
Select country
    Wait Until Element Is Visible    ${COUNTRY_FIELD}    2s
    ${options}=    Get WebElements    xpath=//select[@id='AccountFrm_country_id']/option[not(@value='FALSE')]
    ${random_option}=    Evaluate    random.choice($options)    random
    ${random_value}=    Get Element Attribute    ${random_option}    value
    Select From List By Value    ${COUNTRY_FIELD}     ${random_value}

Fill login name field
    [Arguments]    ${LOGINNAME_VALUE}
	Wait Until Element Is Visible    ${LOGINNAME_FIELD}    2s
	Input Text    ${LOGINNAME_FIELD}    ${LOGINNAME_VALUE}

Fill password field
    [Arguments]    ${PASSWORD_VALUE}
	Wait Until Element Is Visible    ${PASSWORD_FIELD}    2s
	Input Text    ${PASSWORD_FIELD}    ${PASSWORD_VALUE}

Fill confirm password field
    [Arguments]    ${CONFIRMPASSWORD_VALUE}
	Wait Until Element Is Visible    ${CONFIRMPASSWORD_FIELD}    2s
	Input Text    ${CONFIRMPASSWORD_FIELD}    ${CONFIRMPASSWORD_VALUE}

Select subscribe yes
    Wait Until Element Is Visible    ${SUBCSRIBE_YES_CHECKBOX}
    Click Element    ${SUBCSRIBE_YES_CHECKBOX}

Select privacy policy
    Wait Until Element Is Visible    ${PP_CHECKBOX}
    Click Element    ${PP_CHECKBOX}

Click continue button
    Wait Until Element Is Visible    ${CONTINUE_BUTTON}    2s
	Click Element    ${CONTINUE_BUTTON}
    Sleep    2s

Verify signup confirmation message
    Wait Until Element Is Visible    ${SIGNUP_CONFIRMATION_MESSAGE}
    Element Should Contain    ${SIGNUP_CONFIRMATION_MESSAGE}     YOUR ACCOUNT HAS BEEN CREATED!

Verify message for empty first name 
    Element Should Be Visible    ${MAXCHAR_FIRSTNAME_MESSAGE}
    Element Should Contain    ${MAXCHAR_FIRSTNAME_MESSAGE}    First Name must be between 1 and 32 characters!

Verify message for empty last name 
    Element Should Be Visible    ${MAXCHAR_LASTNAME_MESSAGE}
    Element Should Contain    ${MAXCHAR_LASTNAME_MESSAGE}    Last Name must be between 1 and 32 characters!

Verify message for empty email
    Element Should Be Visible    ${INVALID_EMAIL_MESSAGE}
    Element Should Contain    ${INVALID_EMAIL_MESSAGE}    Email Address does not appear to be valid!

Verify message for empty first address
    Element Should Be Visible    ${MAXCHAR_FIRSTADDRESS_MESSAGE}
    Element Should Contain    ${MAXCHAR_FIRSTADDRESS_MESSAGE}    Address 1 must be between 3 and 128 characters!

Verify message for empty city
    Element Should Be Visible    ${MAXCHAR_CITY_MESSAGE}
    Element Should Contain    ${MAXCHAR_CITY_MESSAGE}    City must be between 3 and 128 characters!

Verify message for empty zip code
    Element Should Be Visible    ${MAXCHAR_ZIPCODE_MESSAGE}
    Element Should Contain    ${MAXCHAR_ZIPCODE_MESSAGE}    Zip/postal code must be between 3 and 10 characters!

Verify message for empty login name
    Element Should Be Visible    ${MAXCHAR_LOGINNAME_MESSAGE}
    Element Should Contain    ${MAXCHAR_LOGINNAME_MESSAGE}    Login name must be alphanumeric only and between 5 and 64 characters!

Verify message for empty password
    Element Should Be Visible    ${CHAR_PASSWORD_MESSAGE}
    Element Should Contain    ${CHAR_PASSWORD_MESSAGE}    Password must be between 4 and 20 characters!

Verify password is not same with confirm password 
    Element Should Be Visible    ${MATCH_PASSWORD_MESSAGE}
    Element Should Contain    ${MATCH_PASSWORD_MESSAGE}    Password confirmation does not match password!

Verify signup with registered email 
    Element Should Be Visible    ${ALERTBOX}
    Element Should Contain   ${ALERTBOX}    E-Mail Address is already registered!

