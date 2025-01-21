*** Settings ***
Resource         ../../resources/pages/login.resource
Resource         ../../resources/pages/purchase_flow.resource
Resource         ../../resources/setup.resource
Resource         ../../resources/commons.resource

Test Setup       Run Keywords  Setup Browser  AND  Given I open the login page
Test Teardown    Run Keywords  Take screenshot testing  AND  TearDown Browser  
Test Tags        login_validation

*** Test Cases ***
Login Successfully
    [Documentation]  USER_DEFAULT and PASSWORD_DEFAULT are defined in the resource file commons
    [Tags]   standard_user
    When I login with valid credentials  ${USER_DEFAULT}   ${PASSWORD_DEFAULT}  
    Then I should see the products page

Login with username field empty
    [Tags]   username_required
    When I login with invalid credentials  ${EMPTY}    ${PASSWORD_DEFAULT}  
    Then I should see the login error message on the screen   
    ...    Epic sadface: Username is required

Login with password field empty
    [Tags]   password_required
    When I login with invalid credentials  ${USER_DEFAULT}     ${EMPTY} 
    Then I should see the login error message on the screen   
    ...    Epic sadface: Password is required    

Login with invalid password
    [Tags]   invalid_password
    When I login with invalid credentials  ${USER_DEFAULT}     123456 
    Then I should see the login error message on the screen  
    ...    Epic sadface: Username and password do not match any user in this service            