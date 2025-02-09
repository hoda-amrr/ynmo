*** Settings ***
Library           SeleniumLibrary


*** Variables ***
${username_login_field}                 id=login-username
${password_login_field}                 id=login-password
${login_btn}                            id=login_btn
${my_beneficiaries_title}               xpath=//div/p[@class='font-bold text-md mb-20 sm:mb-0']
${empty_errpr_msg}                      xpath=//span[@id='validation-message']

*** Keywords ***
verify "login" page is loaded
    wait until page contains element    ${username_login_field}

Enter Username and Password
    [Arguments]        ${email}    ${password}
    Input Text         ${username_login_field}    ${email}
    Input Text         ${password_login_field}    ${password}

Submit Login Form
    Click Button       ${login_btn}


Verify "home" page is loaded
    sleep              20s
    wait until page contains element        ${my_beneficiaries_title}

#Accept "Notification" alert
#    handle alert

Verify "Empty" field message is displayed
    wait until page contains element    ${username_login_field}



