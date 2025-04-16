*** Settings ***
Library           SeleniumLibrary
Resource           ../Resources/Login.robot
Resource           ../Resources/common.robot
Resource           ../Resources/PO/beneficiary-page.robot
Suite Setup        Login.login with valid data
Suite Teardown     Close browser

# robot -d results tests/add-beneficiary-cases.robot

*** Variables ***
${add_new_beneficiaries_field}      id=beneficiaryName
&{beneficiaries_list}               item1=Hoda 1    item2=Hoda 2

*** Test Cases ***
Add multiple "Beneficiaries"
    beneficiary-page.Create multiple "Beneficiary"
