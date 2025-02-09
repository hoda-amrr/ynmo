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
${click_item_1}                 xpath=//nz-option-item[@title='Hoda 01']
${password_toggle}              xpath=//div/nz-switch/button[@id='save-family-toggle-auto-generated-password']
${save_add_btn}                 id=save-family-save-and-add-new


*** Keywords ***
Go to "Add Family" page
    click button                        ${add_new_family_btn}
    wait until page contains element    ${new_family_page_title}
    sleep                               10s

Enter required data in "add new family" form
    [Arguments]         ${first_name}       ${last_name}        ${email_family}      ${username}
    input text          ${first_name_field}                 ${first_name}
    input text          ${last_name_field}                  ${last_name}
    input text          ${email_field}                      ${email_family}
    input text          ${username_field}                   ${username}
    sleep               5s

Enter optional data in "add new family" form
    [Arguments]     ${phone_number}
    input text      ${phone_number_field}   ${phone_number}
    select "link beneficiaries" from drop down list

Upload image
    [Arguments]         ${image_path}
    click element       ${img_uploader_field}
    choose file         xpath=//input[@type='file']  ${image_path}
    sleep               5s

Select "Link Beneficiaries" from drop down list
    click element    ${down_arrow_drop_down_list}
    click element    ${click_item_1}

clearing auto generated password and enter new password
    [Arguments]             ${password_family}
    click button            ${password_toggle}
    clear element text      ${password_field}
    input text              ${password_field}   ${password_family}

Submit "New Family"
    click button        ${save_add_btn}