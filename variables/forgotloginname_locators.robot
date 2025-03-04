*** Variables ***
${BROWSER}    chrome
${LASTNAME_FIELD}    id:forgottenFrm_lastname
${EMAIL_FIELD}    id:forgottenFrm_email
${CONTINUE_BUTTON}    xpath=//button[@title='Continue']
${FORGOTLOGINNAME_BUTTON}    xpath=//a[contains(text(), 'Forgot your login?')]
${ALERTBOX}    xpath=//div[contains(@class, 'alert-error')]
${ALERTSUCCESS}    xpath=//div[contains(@class, 'alert-success')]