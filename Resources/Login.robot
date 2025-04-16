*** Settings ***
Library           SeleniumLibrary
Resource           ../Resources/common.robot
Resource           ../Resources/PO/login-page.robot

*** Variables ***
&{user_data}        email=mona.abdelrahim+cent10@trianglz.com   password=P@ssw0rd

*** Keywords ***
login with valid data
    common.Go to landing page
    login-page.verify "login" page is loaded
    login-page.Enter Username and Password    ${user_data.email}    ${user_data.password}
    login-page.Submit Login Form
    login-page.Verify "home" page is loaded
    #login-page.Accept "Notification" alert

Login with invalid data
    [Arguments]    ${email}       ${password}
    login-page.Enter Username and Password    ${email}    ${password}
    login-page.Submit Login Form
    login-page.verify "login" page is loaded
    sleep    3s

