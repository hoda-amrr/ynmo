*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${add_new_beneficiaries_btn}        xpath=/html/body/app-root/div/app-subscriber-dashboard/app-layout-container/yn-layout/section/div/section/app-beneficiaries/app-students-management/div/div[1]/div[1]/div[1]/div/yn-button[2]/button
${add_new_beneficiaries_field}      id=beneficiaryName
&{beneficiaries_list}               item1=Hoda 1    item2=Hoda 2
${add_btn}                          xpath=//button[text()=" إضافة "]

*** Keywords ***
Open "Add Beneficiary" popup
    click element                       ${add_new_beneficiaries_btn}
    sleep   5s
    wait until page contains element    ${add_new_beneficiaries_field}

Create multiple "Beneficiary"
    FOR    ${key}    ${value}   IN    &{beneficiaries_list}
        click element                       ${add_new_beneficiaries_btn}
        sleep   5s
        wait until page contains element    ${add_new_beneficiaries_field}
        input text                          ${add_new_beneficiaries_field}      ${value}
        sleep   5s
        click button                        ${add_btn}
        sleep    5s
    END
