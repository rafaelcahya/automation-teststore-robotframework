*** Settings ***
Library    SeleniumLibrary
Library    ../EnvLoader.py

*** Variables ***
${BROWSER}    chrome
${REGISTER_PAGE}    class:account-create
${FIRSTNAME_FIELD}    id:AccountFrm_firstname
${LASTNAME_FIELD}    id:AccountFrm_lastname
${EMAIL_FIELD}    id:AccountFrm_email
${TELEPHONE_FIELD}    id:AccountFrm_telephone
${FAX_FIELD}    id:AccountFrm_fax
${COMPANY_FIELD}    id:AccountFrm_company
${FIRSTADDRESS_FIELD}    id:AccountFrm_address_1
${SECONDADDRESS_FIELD}    id:AccountFrm_address_2
${CITY_FIELD}    id:AccountFrm_city
${ZONE_FIELD}    id:AccountFrm_zone_id
${ZIPCODE_FIELD}    id:AccountFrm_postcode
${COUNTRY_FIELD}    id:AccountFrm_country_id
${LOGINNAME_FIELD}    id:AccountFrm_loginname
${PASSWORD_FIELD}    id:AccountFrm_password
${CONFIRMPASSWORD_FIELD}    id:AccountFrm_confirm
${SUBCSRIBE_YES_CHECKBOX}    id:AccountFrm_newsletter1
${PP_CHECKBOX}    id:AccountFrm_agree
${CONTINUE_BUTTON}    xpath=//button[@title='Continue']
${REGISTER_BUTTON}    xpath=//button[@title='Continue']

${SIGNUP_CONFIRMATION_MESSAGE}    xpath=//span[@class='maintext' and contains(text(), 'Your Account Has Been Created!')]
${MAXCHAR_FIRSTNAME_MESSAGE}    xpath=//span[contains(text(), 'First Name must be between 1 and 32 characters!')]
${MAXCHAR_LASTNAME_MESSAGE}    xpath=//span[contains(text(), 'Last Name must be between 1 and 32 characters!')]
${INVALID_EMAIL_MESSAGE}    xpath=//span[contains(text(), 'Email Address does not appear to be valid!')]
${MAXCHAR_FIRSTADDRESS_MESSAGE}    xpath=//span[contains(text(), 'Address 1 must be between 3 and 128 characters!')]
${MAXCHAR_CITY_MESSAGE}    xpath=//span[contains(text(), 'City must be between 3 and 128 characters!')]
${MAXCHAR_ZIPCODE_MESSAGE}    xpath=//span[contains(text(), 'Zip/postal code must be between 3 and 10 characters!')]
${MAXCHAR_LOGINNAME_MESSAGE}    xpath=//span[contains(text(), 'Login name must be alphanumeric only and between 5 and 64 characters!')]
${CHAR_PASSWORD_MESSAGE}    xpath=//span[contains(text(), 'Password must be between 4 and 20 characters!')]
${MATCH_PASSWORD_MESSAGE}    xpath=//span[contains(text(), 'Password confirmation does not match password!')]
${ALERTBOX}    xpath=//div[contains(@class, 'alert-error')]

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
    Wait Until Element Is Visible    ${ZONE_FIELD}    5s
    ${options}=    Get WebElements    xpath=//select[@id='AccountFrm_zone_id']/option[not(@value='FALSE')]
    ${random_option}=    Evaluate    random.choice($options)    random
    ${random_value}=    Get Element Attribute    ${random_option}    value
    Select From List By Value    ${ZONE_FIELD}     ${random_value}

Fill zipcode field
    [Arguments]    ${ZIPCODE_VALUE}
	Wait Until Element Is Visible    ${ZIPCODE_FIELD}    2s
	Input Text    ${ZIPCODE_FIELD}    ${ZIPCODE_VALUE}
    
Select country
    Wait Until Element Is Visible    ${COUNTRY_FIELD}    5s
    ${options}=    Get WebElements    xpath=//select[@id='AccountFrm_country_id']/option[not(@value='FALSE')]
    ${random_option}=    Evaluate    random.choice($options)    random
    ${random_value}=    Get Element Attribute    ${random_option}    value
    Select From List By Value    ${COUNTRY_FIELD}     ${random_value}
    Click Element    ${REGISTER_PAGE}

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

