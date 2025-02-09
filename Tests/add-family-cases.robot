*** Settings ***
Library           SeleniumLibrary
Resource           ../Resources/login.robot
Resource           ../Resources/common.robot
Resource           ../Resources/PO/family-page.robot
Suite Setup        login.login with valid data
Suite Teardown     Close browser

# robot -d results tests/add-family-cases.robot

*** Variables ***
&{family-data}          first_name=Hoda     last_name=Amr   email=hoda.amr@trianglz.com     username=hoda123    phone_number=01112413768  password=Ynmo@123
${image_uploader}       id=save-family-image-uploader-upload-image
${image_path}           D:/TrianglZ/Automation/family.jpg


*** Test Cases ***
Add new family with required data [auto generated password]
    [Documentation]    TC_1
    common.Click "family" from side menu
    family-page.Go to "Add Family" page
    family-page.enter required data in "add new family" form    ${family-data}[first_name]      ${family-data}[last_name]   ${family-data}[email]   ${family-data}[username]
    family-page.submit "new family"

Add new family with all fields [manual password]
    [Documentation]    TC_2
    common.Click "family" from side menu
    family-page.Go to "Add Family" page
    family-page.enter required data in "add new family" form    ${family-data}[first_name]      ${family-data}[last_name]   ${family-data}[email]   ${family-data}[username]
    family-page.Enter optional data in "add new family" form    ${family-data}[phone_number]
    family-page.Upload image                                    ${image_path}
    family-page.clearing auto generated password and enter new password     ${family-data}[password]
    family-page.submit "new family"

