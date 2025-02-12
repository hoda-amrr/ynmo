*** Settings ***
Library           SeleniumLibrary

*** Variables ***
&{browsing-data}                    url=https://test-app-revamp.ynmodata.com/auth/login     browser=chrome
${family_side_menu_icon}            xpath=//li/a/span[@class='yn-icon__family-side-menu']
${add_new_family_btn}               xpath=//div/yn-button/button[@id='families-header-action-button']
${beneficiaries_side_menu_icon}     xpath=//li/a/span[@class='yn-icon__staff']
${add_new_beneficiaries_btn}        xpath=/html/body/app-root/div/app-subscriber-dashboard/app-layout-container/yn-layout/section/div/section/app-beneficiaries/app-students-management/div/div[1]/div[1]/div[1]/div/yn-button[2]/button
${profile_drop_down_list}           xpath=//div/div[@class='ant-dropdown-trigger lg:bg-grey-bg01 lg:p-10 rounded-md flex items-center gap-10 lg:h-64 ms-auto lg:me-10 flex-shrink-0 cursor-pointer']
${logout-button}                    xpath=/html/body/div/div/div/div/yn-navbar-dropdown-menu/ul/li[3]/span/span

*** Keywords ***
Go to landing page
    open browser    ${browsing-data}[url]  ${browsing-data}[browser]
    maximize browser window
    sleep   10s

Click "family" from side menu
    click element                           ${family_side_menu_icon}
    wait until page contains element        ${add_new_family_btn}

Click "beneficiaries" from side menu
    click element                           ${beneficiaries_side_menu_icon}
    wait until page contains element        ${add_new_family_btn}

Logout
    click element    ${profile_drop_down_list}
    sleep            5s
    click element    ${logout-button}

