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