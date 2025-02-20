*** Settings ***
Library    String
Library    BuiltIn

*** Keywords ***
Generate Random Number
    ${RANDOM_NUMBER}=    Evaluate    random.randint(1000, 9999)    modules=random
    ${DUMMY_NUMBER}=    Set Variable    ${RANDOM_NUMBER}
    RETURN    ${DUMMY_NUMBER}

Generate Random Quantity
    ${RANDOM_NUMBER}=    Evaluate    random.randint(1, 10)    modules=random
    ${DUMMY_NUMBER}=    Set Variable    ${RANDOM_NUMBER}
    RETURN    ${DUMMY_NUMBER}
