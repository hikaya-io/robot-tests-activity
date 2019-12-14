*** Settings ***
Documentation    Base Page Keywords Resource File
...              This keywords resource file contains user keywords which define common
...              interations of elements in the Base page as well as common UI interations.
Resource         CommonVariables.resource
Variables        CustomLibraries/Credentials.py                                               # This file is contained in the repo.
Variables        ../PageObjects/BasePage.py
Variables        ../PageObjects/DashboardPage.py

*** Keywords ***
# Activty Application Launch
Launch Activity Application
    [Arguments]                         ${baseUrl}                                            ${browser}
    Open Browser                        ${baseUrl}                                            ${browser}
    Maximize Browser Window
    Set Selenium Timeout                ${EXEC TIMEOUT}

# Single ACT UI Element Interactions
Input ACT Textbox
    [Arguments]                         ${textbox}                                            ${text}
    [Documentation]                     This Keyword enters text
    ...                                 on any textbox
    Wait Until Page Contains Element    ${textbox}
    Wait Until Element Is Visible       ${textbox}
    Element Should Be Enabled           ${textbox}
    Input Text                          ${textbox}                                            ${text}

Click ACT Element
    [Arguments]                         ${element}
    [Documentation]                     This Keyword clicks all
    ...                                 clikable UI elements
    Wait Until Page Contains Element    ${element}
    Wait Until Element Is Visible       ${element}
    Element Should Be Enabled           ${element}
    Click Element                       ${element}

Click ACT Element Using JavaScript
    [Arguments]                         ${element}
    [Documentation]                     This Keyword clicks all
    ...                                 clikable UI elements using JS
    Wait Until Page Contains Element    ${element}
    Execute JavaScript                  document.evaluate('${element}',
    ...                                 document.body,null,9,null).singleNodeValue.click()

Mouse Hover on ACT Element
    [Arguments]                         ${element}
    [Documentation]                     This Keyword mouse hovers
    ...                                 on selected UI elements
    Wait Until Page Contains Element    ${element}
    Mouse Over                          ${element}

Select ACT DropDown Label Value
    [Arguments]                         ${dropdown}                                           ${label}
    [Documentation]                     This Keyword select dropdown
    ...                                 values by label
    Wait Until Page Contains Element    ${dropdown}
    Select From List By Label           ${dropdown}                                           ${label}

# Login
Enter Login Credentials
    [Arguments]                         ${username}                                           ${password}
    Input ACT Textbox                   ${tb_login_username}                                  ${username}
    Input ACT Textbox                   ${tb_login_password}                                  ${password}
    Click ACT Element                   ${btn_login_submit}

Validate Successful Login
    Wait Until Page Contains Element    ${lbl_dashboard_title}
    Page Should Contain Element         ${lbl_workflow_panel_title}
    Page Should Contain Element         ${lbl_indicator_panel_title}
    Page Should Contain Element         ${lbl_components_panel_title}

Login with Valid Credentials
    [Arguments]                         ${username}                                           ${password}
    Enter Login Credentials             ${username}                                           ${password}
    Validate Successful Login

# Page Navigation
Display ACT Page
    [Arguments]                         ${page_link}                                          ${page_validation}
    Click ACT Element                   ${page_link}
    Wait Until Page Contains Element    ${page_validation}

Display ACT Page Using DropDown
    [Arguments]                         ${menu}                                               ${submenu}                   ${page}
    Click ACT Element                   ${menu}
    Display ACT Page                    ${submenu}                                            ${page}

# Form Filling
Fill Activity Form
    [Arguments]                         ${form_data}
    @{data_keys}                        Get Dictionary Keys                                   ${form_data}                 sort_keys=False
    FOR                                 ${data_key}                                           IN                           @{data_keys}
    ${web_element}                      Get Webelement                                        ${form_data}[${data_key}]
    Run Keyword If                      '${web_element.get_attribute("type")}'=='text'
    ...                                 Input ACT Textbox                                     ${form_data}[${data_key}]    ${data_key}
    Run Keyword If                      '${web_element.tag_name}'=='textarea'
    ...                                 Input ACT Textbox                                     ${form_data}[${data_key}]    ${data_key}
    END