*** Settings ***
Documentation    Base Page Keywords Resource File
...              This keywords resource file contains user keywords which define common
...              interations of elements in the Base page as well as common UI interations.
Library          OperatingSystem
Library          SeleniumLibrary
Library          Collections
Resource         CommonVariables.resource
Variables        CustomLibraries/Credentials.py                                                # This file is NOT contained in the repo.
Variables        ../PageObjects/BasePage.py
Variables        ../PageObjects/DashboardPage.py

*** Keywords ***
Precondition Status Check
    [Arguments]                                 ${test_case}
    Run Keyword If                              '${PREV TEST STATUS}'=='FAIL' and '${test_case}'!='None'    Fail                                                 Precondtion Test Case ${test_case} Failed
    Run Keyword If                              '${PREV TEST STATUS}'=='FAIL' and '${test_case}'=='None'    Reset Execution ENV

Reset Execution ENV
    Close All Browsers
    Launch Activity Application

# Activty Application Launch
# Launch Activity Application
    # [Arguments]
    # Open Browser                        ${BASE URL}                                            ${BROWSER}
    # Maximize Browser Window
    # Set Selenium Timeout                ${EXEC TIMEOUT}
# Lauches Activity Application In headless mode
Launch Activity Application
    ${dwn_dir}                                  Create Download Folder
    ${chromeOptions}=                           Evaluate                                                    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${prefs} =                                  Create Dictionary                                           download.default_directory=${dwn_dir}
    Call Method                                 ${chromeOptions}                                            add_experimental_option                              prefs                                             ${prefs}
    Call Method                                 ${chromeOptions}                                            add_argument                                         --headless
    Call Method                                 ${chromeOptions}                                            add_argument                                         --window-size\=1920,1920
    Call Method                                 ${chromeOptions}                                            add_argument                                         --disable-gpu
    Create Webdriver                            Chrome                                                      chrome_options=${chromeOptions}
    Maximize Browser Window
    Set Selenium Timeout                        ${EXEC TIMEOUT}
    Go To                                       ${BASE URL}

# Single ACT UI Element Interactions
Input ACT Textbox
    [Arguments]                                 ${textbox}                                                  ${text}
    [Documentation]                             This Keyword enters text
    ...                                         on any textbox
    Wait Until Page Contains Element            ${textbox}
    Wait Until Element Is Visible               ${textbox}
    Element Should Be Enabled                   ${textbox}
    Input Text                                  ${textbox}                                                  ${text}

Click ACT Element
    [Arguments]                                 ${element}
    [Documentation]                             This Keyword clicks all
    ...                                         clikable UI elements
    Wait Until Page Contains Element            ${element}
    Wait Until Element Is Visible               ${element}
    Element Should Be Enabled                   ${element}
    Click Element                               ${element}

Click ACT Element Using JavaScript
    [Arguments]                                 ${element}
    [Documentation]                             This Keyword clicks all
    ...                                         clikable UI elements using JS
    Wait Until Page Contains Element            ${element}
    Execute JavaScript                          document.evaluate('${element}',
    ...                                         document.body,null,9,null).singleNodeValue.click()

Mouse Hover on ACT Element
    [Arguments]                                 ${element}
    [Documentation]                             This Keyword mouse hovers
    ...                                         on selected UI elements
    Wait Until Page Contains Element            ${element}
    Mouse Over                                  ${element}

Select ACT DropDown Label Value
    [Arguments]                                 ${dropdown}                                                 ${label}
    [Documentation]                             This Keyword select dropdown
    ...                                         values by label
    Wait Until Page Contains Element            ${dropdown}
    Select From List By Label                   ${dropdown}                                                 ${label}

# Login
Enter Login Credentials
    [Arguments]                                 ${username}                                                 ${password}
    Input ACT Textbox                           ${tb_login_username}                                        ${username}
    Input ACT Textbox                           ${tb_login_password}                                        ${password}
    Click ACT Element                           ${btn_login_submit}

Enter Login Credentials (Popup)
    [Arguments]                                 ${username}                                                 ${password}
    Click ACT Element                           ${hl_login_dropdown}
    Input ACT Textbox                           ${tb_pnl_login_username}                                    ${username}
    Input ACT Textbox                           ${tb_pnl_login_password}                                    ${password}
    Click ACT Element                           ${btn_pnl_login_signin}

Validate Successful Login
    Wait Until Page Contains Element            ${lbl_dashboard_title}
    Page Should Contain Element                 ${lbl_workflow_panel_title}
    Page Should Contain Element                 ${lbl_indicator_panel_title}
    Page Should Contain Element                 ${lbl_components_panel_title}

Login with Valid Credentials
    [Arguments]                                 ${username}                                                 ${password}
    Enter Login Credentials                     ${username}                                                 ${password}
    Validate Successful Login

# Page Navigation
Display ACT Page
    [Arguments]                                 ${page_link}                                                ${page_validation}
    Click ACT Element                           ${page_link}
    Wait Until Page Contains Element            ${page_validation}

Display ACT Page Using DropDown
    [Arguments]                                 ${menu}                                                     ${submenu}                                           ${page}
    Click ACT Element                           ${menu}
    Display ACT Page                            ${submenu}                                                  ${page}

# Form Filling
Fill Activity Form
    [Arguments]                                 ${form_data}
    @{data_keys}                                Get Dictionary Keys                                         ${form_data}                                         sort_keys=False
    FOR                                         ${data_key}                                                 IN                                                   @{data_keys}
    ${web_element}                              Get Webelement                                              ${form_data}[${data_key}]
    Run Keyword If                              '${web_element.get_attribute("type")}'=='text'
    ...                                         Input ACT Textbox                                           ${form_data}[${data_key}]                            ${data_key}
    Run Keyword If                              '${web_element.tag_name}'=='textarea'
    ...                                         Input ACT Textbox                                           ${form_data}[${data_key}]                            ${data_key}
    END

ACT Page Contains Multiple Elements
    [Documentation]                             Validate page contains multiple elements.
    [Arguments]                                 ${elements}
    FOR                                         ${element}                                                  IN                                                   @{elements}
    Page Should Contain Element                 ${element}
    END


# File Download
Create Download Folder
    ${dwn_dir}                                  Join Path                                                   ${OUTPUT DIR}                                        Downloads
    Create Directory                            ${dwn_dir}
    Empty Directory                             ${dwn_dir}
    [Return]                                    ${dwn_dir}

Download should be done
    [Arguments]                                 ${directory}
    ${files}                                    List Files In Directory                                     ${directory}
    Length Should Be                            ${files}                                                    1                                                    Should be only one file in the download folder
    Should Not Match Regexp                     ${files[0]}                                                 (?i).*\\.tmp                                         Chrome is still downloading a file
    Should Not Match Regexp                     ${files[0]}                                                 (?i).*\\.crdownload                                  Chrome is still downloading a file
    ${file}                                     Join Path                                                   ${directory}                                         ${files[0]}
    Log                                         Download Successful: ${file}
    [Return]                                    ${file}

Empty Download Directory
    ${dwn_dir}                                  Join Path                                                   ${OUTPUT DIR}                                        Downloads
    Empty Directory                             ${dwn_dir}

Download File From Link
    [Arguments]                                 ${download_url}
    Empty Download Directory
    Go To                                       ${download_url}
    Check Download File Progress

Download File by Click
    [Arguments]                                 ${download_btn}
    Empty Download Directory
    Wait Until Page Contains Element            ${download_btn}
    Click DP Element                            ${download_btn}
    Check Download File Progress

Check Download File Progress
    ${dwn_dir}                                  Join Path                                                   ${OUTPUT DIR}                                        Downloads
    ${file}                                     Wait Until Keyword Succeeds                                 1 min                                                2 sec                                             Download should be done    ${dwn_dir}

# Toast
Validate Toast Message
    [Arguments]                                 ${message}                                                  ${title}=None
    Wait Until Page Contains Element            ${pnl_toast}
    Run Keyword If                              '${title}'!='None'                                          Element Text Should Be                               ${lbl_toast_title}                                ${title}
    Element Text Should Be                      ${lbl_toast_message}                                        ${message}
    Wait Until Page Does Not Contain Element    ${pnl_toast}
