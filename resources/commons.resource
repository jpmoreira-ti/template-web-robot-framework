*** Settings ***
Library    Browser

*** Variables ***
${DEFAULT_TIMEOUT_ELEMENT}  5s
${USER_DEFAULT}        standard_user
${PASSWORD_DEFAULT}    secret_sauce


*** Keywords ***
Take screenshot testing
    Run Keyword If  '${TEST_STATUS}' == 'FAIL'   
    ...    Take Screenshot   ${TEST_NAME}_failure   
