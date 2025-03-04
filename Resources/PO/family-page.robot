*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${add_new_family_btn}           xpath=//div/yn-button/button[@id='families-header-action-button']
${new_family_page_title}        xpath=//div/p[@class='font-bold text-md mb-10 sm:mb-0']
${first_name_field}             id=save-family-firstName
${last_name_field}              id=save-family-lastName
${email_field}                  id=save-family-email
${username_field}               id=save-family-username
${password_field}               id=save-family-password
${phone_number_field}           id=save-family-mobile
${img_uploader_field}           id=save-family-image-uploader-upload-image
${down_arrow_drop_down_list}    xpath=//div/span[@class='c-arrow__icon yn-icon__chevron-bottom text-white text-vtiny h-30 w-30 flex-center']
${click_item_1}                 xpath=//nz-option-item[@title='Hoda 1']
${click_item_2}                 xpath=//nz-option-item[@title='Hoda 2']
&{beneficiaries_list}           item1=Hoda 1    item2=Hoda 2
${password_toggle}              xpath=//div/nz-switch/button[@id='save-family-toggle-auto-generated-password']
${save_add_btn}                 id=save-family-save-and-add-new
&{beneficiaries_items}          item1=${click_item1}        item2=${click_item2}
${beneficiaries_field}          xpath=/html/body/app-root/div/app-subscriber-dashboard/app-layout-container/yn-layout/section/div/section/app-families/app-add-edit-families/section/div[1]/div/app-save-user/div/div[1]/div[1]/div[11]/yn-select/div/nz-select


*** Keywords ***
Go to "Add Family" page
    click button                        ${add_new_family_btn}
    wait until page contains element    ${new_family_page_title}
    sleep                               10s

Enter required data in "add new family" form
    [Arguments]         ${family_data.first_name}       ${family_data.last_name}        ${family_data.email}        ${family_data.username}
    input text          ${first_name_field}                 ${family_data.first_name}
    input text          ${last_name_field}                  ${family_data.last_name}
    input text          ${email_field}                      ${family_data.email}
    input text          ${username_field}                   ${family_data.username}
    sleep               5s

Enter optional data in "add new family" form
    [Arguments]     ${family_data.phone_number}
    input text      ${phone_number_field}   ${family_data.phone_number}
    select "link beneficiaries" from drop down list

Upload image
    [Arguments]         ${family_data.img_path}
    click element       ${img_uploader_field}
    choose file         xpath=//input[@type='file']  ${family_data.img_path}
    sleep               5s

Select "Link Beneficiaries" from drop down list
    click element    ${down_arrow_drop_down_list}
    click element    ${click_item_1}

Select multiple "Beneficiaries" from drop down list
    click element    ${down_arrow_drop_down_list}
    FOR    ${key}    ${value}   IN    &{beneficiaries_items}
        click element    ${value}
        sleep    2s
    END


clearing auto generated password and enter new password
    [Arguments]             ${family_data.password}
    click button            ${password_toggle}
    clear element text      ${password_field}
    input text              ${password_field}   ${family_data.password}

Submit "New Family"
    click button        ${save_add_btn}