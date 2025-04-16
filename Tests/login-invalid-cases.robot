*** Settings ***
Library         SeleniumLibrary
Library         DataDriver  ../TestData/credentials.csv
Resource        ../Resources/PO/login-page.robot
Resource        ../Resources/Login.robot
Resource        ../Resources/common.robot
Suite Setup     common.go to landing page
Suite Teardown  Close browser
Test Template   Login with invalid data

# robot -d results tests/login-invalid-cases.robot

*** Test Cases ***
Login with invalid data using csv file  ${email}    ${password}

*** Keywords ***
Login with invalid data
    [Arguments]    ${email}       ${password}
    login-page.Enter Username and Password    ${email}    ${password}
    login-page.Submit Login Form
    login-page.verify "login" page is loaded
    sleep    3s