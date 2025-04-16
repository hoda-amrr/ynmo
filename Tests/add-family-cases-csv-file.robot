*** Settings ***
Library           SeleniumLibrary
Library           DataDriver  ../TestData/family.csv
Resource           ../Resources/Login.robot
Resource           ../Resources/common.robot
Resource           ../Resources/PO/family-page.robot
Suite Setup        Login.login with valid data
Suite Teardown     Close browser
Test Template      Add New Family

# robot -d results tests/add-family-cases-csv-file.robot

*** Variables ***
&{family_data}          first_name=Hoda     last_name=Amr   email=hoda.amr@trianglz.com     username=hoda123    phone_number=01112413768  password=Ynmo@123     img_path=D:/TrianglZ/Automation/family.jpg

*** Test Cases ***
Add new family with required data [auto generated password] ${firstName}     ${lastName}     ${email}    ${username}


*** Keywords ***
Add New Family
    [Arguments]    ${firstName}     ${lastName}     ${email}    ${username}
    common.Click "family" from side menu
    family-page.Go to "Add Family" page
    family-page.enter required data in "add new family" form    ${family_data.first_name}      ${family_data.last_name}   ${family_data.email}   ${family_data.username}
    family-page.submit "new family"