*** Settings ***
Library           SeleniumLibrary
Resource           ../Resources/login.robot
Resource           ../Resources/common.robot
Resource           ../Resources/PO/family-page.robot
Suite Setup        login.login with valid data
Suite Teardown     Close browser

# robot -d results tests/add-family-cases.robot

*** Variables ***
&{family_data}          first_name=Hoda     last_name=Amr   email=hoda.amr@trianglz.com     username=hoda123    phone_number=01112413768  password=Ynmo@123     img_path=D:/TrianglZ/Automation/family.jpg

*** Test Cases ***
Add new family with required data [auto generated password]
    [Tags]    TC_1
    common.Click "family" from side menu
    family-page.Go to "Add Family" page
    family-page.enter required data in "add new family" form    ${family_data.first_name}      ${family_data.last_name}   ${family_data.email}   ${family_data.username}
    family-page.submit "new family"

Add new family with all fields [manual password]
    [Tags]    TC_2
    common.Click "family" from side menu
    family-page.Go to "Add Family" page
    family-page.enter required data in "add new family" form    ${family_data.first_name}      ${family_data.last_name}  ${family_data.email}  ${family_data.username}
    family-page.Enter optional data in "add new family" form    ${family_data.phone_number}
    family-page.Upload image                                    ${family_data.img_path}
    family-page.clearing auto generated password and enter new password     ${family_data.password}
    family-page.submit "new family"


Add new family by selecting multiple beneficiaries
    [Tags]        TC_3
    common.Click "family" from side menu
    family-page.Go to "Add Family" page
    family-page.enter required data in "add new family" form    ${family_data.first_name}      ${family_data.last_name}  ${family_data.email}   ${family_data.username}
    family-page.Enter optional data in "add new family" form    ${family_data.phone_number}
    family-page.Select multiple "Beneficiaries" from drop down list
    family-page.submit "new family"

