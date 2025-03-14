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
${ALERTBOX}    xpath=//div[contains(@class, 'alert-error')]

${MAXCHAR_FIRSTNAME_MESSAGE}    xpath=//span[contains(text(), 'First Name must be between 1 and 32 characters!')]
${MAXCHAR_LASTTNAME_MESSAGE}    xpath=//span[contains(text(), 'Last Name must be between 1 and 32 characters!')]
${MAXCHAR_FIRSTADDRESS_MESSAGE}    xpath=//span[contains(text(), 'Address must be between 3 and 128 characters!')]
${MAXCHAR_CITY_MESSAGE}    xpath=//span[contains(text(), 'City must be between 3 and 128 characters!')]
${EMPTY_REGION_MESSAGE}    xpath=//span[contains(text(), 'Please select a region / state!')]
${MAXCHAR_ZIPCODE_MESSAGE}    xpath=//span[contains(text(), 'Zip/postal code must be between 2 and 10 characters!')]
