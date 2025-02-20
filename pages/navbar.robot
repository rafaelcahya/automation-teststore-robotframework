*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGOUT_BUTTON}    id:customer_logout_link
${APPAREL}    css=a[href*='path=68']
${SHOESCATEGORY}    xpath=//a[contains(text(), 'Shoes')]

*** Keywords ***
Logout button is displayed
    Wait Until Element Is Visible    ${LOGOUT_BUTTON}    2s
	Element Should Be Visible    ${LOGOUT_BUTTON}
	Input Text    locator    text

Click apparel button
    Wait Until Element Is Visible    ${APPAREL}    2s
	Mouse Over    ${APPAREL}

Click shoes category
    Wait Until Element Is Visible    ${SHOESCATEGORY}    2s
	Click Element    ${SHOESCATEGORY}
    