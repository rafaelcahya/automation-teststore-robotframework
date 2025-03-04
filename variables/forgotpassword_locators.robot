*** Variables ***
${BROWSER}    chrome
${LOGINNAME_FIELD}    id:forgottenFrm_loginname
${EMAIL_FIELD}    id:forgottenFrm_email
${CONTINUE_BUTTON}    xpath=//button[@title='Continue']
${FORGOTPASSWORD_BUTTON}    xpath=//a[contains(text(), 'Forgot your password?')]
${ALERTBOX}    xpath=//div[contains(@class, 'alert-error')]
${ALERTSUCCESS}    xpath=//div[contains(@class, 'alert-success')]