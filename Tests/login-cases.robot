*** Settings ***
Library         SeleniumLibrary
Resource        ../Resources/PO/login-page.robot
Resource        ../Resources/login.robot
Resource        ../Resources/common.robot
Suite Setup     common.go to landing page
Suite Teardown  Close browser
Test Setup      login-page.verify "login" page is loaded

# robot -d results tests/login-cases.robot


*** Variables ***
&{user_data}            email=mona.abdelrahim+cent10@trianglz.com   password=P@ssw0rd
&{empty_user_data}      email=   password=
&{invalid_email}        email=mona.abdelrahim+cent10trianglz.com    password=P@ssw0rd
&{invalid_password}     email=mona.abdelrahim+cent10@trianglz.com   password=Pssw0rd


*** Test Cases ***
login with valid data
    login-page.Enter Username and Password          ${user_data.email}    ${user_data.password}
    login-page.Submit Login Form
    login-page.Verify "home" page is loaded
    [Teardown]                                      common.Logout

login with empty fileds
    [Arguments]    ${user_data}
    login-page.Submit Login Form
    login-page.Verify "Empty" field message is displayed

login with multiple invalid
    [Tags]          TC_3
    [Template]    login.multiple invalid login
    ${empty_user_data}
    ${invalid_email}
    ${invalid_password}
