*** Settings ***
Documentation              [TODO] Document this TestSuite
Library                    Collections
Library                    SeleniumLibrary
Library                    ../../Resources/CustomLibraries/EmailNotifications.py
Library                    ../../Resources/CustomLibraries/AdminCleaning.py
Resource                   ../../Resources/CommonKeywords.resource
Resource                   ../../Resources/OrganizationSettingsKeywords.resource
Variables                  ../../PageObjects/CreateOrganizationPage.py
Suite Setup                Launch Activity Application                              ${BASE URL}                                    ${FIREFOX}
Suite Teardown             Close All Browsers

*** Variable ***
${First Name}              Registration
${Last Name}               Tester
${Confirm Email Text}      Proceed to your email account to confirm
...                        your email address to activate your account
${Verification Warning}    Please verify your email address then try again.
${Verification Success}    Thanks, your email address has been confirmed
${Confirm Email}           Please confirm your email address
${Link Confirm Title}      Confirm email
${Welcome Email}           Welcome to Activity
${Link Welcome Title}      Log in to Activity
&{New Org Data}            QA New Org=${tb_org_name}                                New Organization Description=${tb_org_desc}
...                        Kenya=${tb_org_location}                                 https://hikaya.io/=${tb_org_url}
@{Invite Users}            ${SIGN_UP_EMAIL_O}
${Invitation Email}        Invitation to Join Activity
${Link Reg Title}          Complete Registration


*** Test Case ***
ACTATC-1.1 Register a New User
    Display ACT Page                    ${hl_reg_tab}                     ${lbl_reg_title}
    Input ACT Textbox                   ${tb_reg_first_name}              ${First Name}
    Input ACT Textbox                   ${tb_reg_last_name}               ${Last Name}
    Input ACT Textbox                   ${tb_reg_username}                ${ACT_SIGN_UP_USERNAME}
    Input ACT Textbox                   ${tb_reg_email_address}           ${SIGN_UP_EMAIL_O}
    Input ACT Textbox                   ${tb_reg_password}                ${ACT_SIGN_UP_PASS}
    Input ACT Textbox                   ${tb_reg_confirm_password}        ${ACT_SIGN_UP_PASS}
    Click ACT Element                   ${btn_reg_submit}
    Wait Until Page Contains Element    ${lbl_reg_confirm_email_title}
    Page Should Contain                 ${Confirm Email Text}

ACTATC-1.2 Login to Activity before Email Verification
    Display ACT Page                    ${btn_login}                      ${lbl_login_title}
    Enter Login Credentials             ${ACT_SIGN_UP_USERNAME}           ${ACT_SIGN_UP_PASS}
    Wait Until Page Contains Element    ${pnl_alerts_container}
    Page Should Contain                 ${Verification Warning}

ACTATC-1.3 Activate Registration and Login
    ${activation_url}                   Get Url                           ${Confirm Email}             ${Link Confirm Title}
    Go To                               ${activation_url}
    Wait Until Page Contains Element    ${pnl_alerts_container}
    Page Should Contain                 ${Verification Success}
    ${login_url}                        Get Url                           ${Welcome Email}             ${Link Welcome Title}
    Go To                               ${login_url}
    Enter Login Credentials             ${ACT_SIGN_UP_USERNAME}           ${ACT_SIGN_UP_PASS}
    Wait Until Page Contains Element    ${lbl_create_org}

ACTATC-1.4 Create a New Organization
    Fill Activity Form                  ${New Org Data}
    Element Should Be Disabled          ${tb_org_act_url}
    Textfield Value Should Be           ${tb_org_act_url}                 ${ACTIVITY URL}qa-new org
    Click ACT Element                   ${btn_org_create}
    Click ACT Element                   ${hl_user_popup}
    Element Should Contain              ${lbl_signed_in_user}             ${ACT_SIGN_UP_USERNAME}
    @{data_keys}                        Get Dictionary Keys               ${New Org Data}              sort_keys=False
    Page Should Contain                 ${data_keys}[0]
    Click ACT Element                   ${hl_sign_out}
    ${user_deleted}                     Admin Delete Item                 ${ACT_SIGN_UP_USERNAME}      User
    ${org_deleted}                      Admin Delete Item                 ${data_keys}[0]              Organization

ACTATC-1.5 Invite a New User
    Login with Valid Credentials        ${OA_USERNAME}                    ${ACT_PASS}
    Display ACT Page Using DropDown     ${hl_user_popup}                  ${hl_user_org_settings}      ${lbl_org_settings_title}
    Display ACT Page                    ${hl_tab_people}                  ${tbl_users}
    Invite a User                       ${lbl_org_fbh}                    @{Invite Users}
    Display ACT Page Using DropDown     ${hl_user_popup}                  ${hl_sign_out}               ${lbl_login_title}

# [TODO] ACTATC-1.6 Resend Invited New User Link
# [TODO] ACTATC-1.7 Revoke and Resend Invite to New User

ACTATC-1.8 Complete Registration of Invited User
    ${reg_url}                          Get Url                           ${Invitation Email}          ${Link Reg Title}
    Go To                               ${reg_url}
    Input ACT Textbox                   ${tb_reg_first_name}              ${First Name}
    Input ACT Textbox                   ${tb_reg_last_name}               ${Last Name}
    Input ACT Textbox                   ${tb_reg_username}                ${ACT_SIGN_UP_USERNAME}
    Textfield Value Should Be           ${tb_reg_email_address}           ${SIGN_UP_EMAIL_O}
    Click Element                       ${tb_reg_email_address}           # [TODO: Remove this step. Defect: Workaround to enable Submit Button]
    Input ACT Textbox                   ${tb_reg_password}                ${ACT_SIGN_UP_PASS}
    Input ACT Textbox                   ${tb_reg_confirm_password}        ${ACT_SIGN_UP_PASS}
    Click ACT Element                   ${btn_reg_submit}
    Wait Until Page Contains Element    ${pnl_alerts_container}
    Page Should Contain                 ${Verification Success}
    ${login_url}                        Get Url                           ${Welcome Email}             ${Link Welcome Title}
    Go To                               ${login_url}
    Login with Valid Credentials        ${ACT_SIGN_UP_USERNAME}           ${ACT_SIGN_UP_PASS}
    Click ACT Element                   ${hl_user_popup}
    Element Should Contain              ${lbl_signed_in_user}             ${ACT_SIGN_UP_USERNAME}
    Page Should Contain                 ${FBH NAME}
    Click ACT Element                   ${hl_sign_out}
    ${user_deleted}                     Admin Delete Item                 ${ACT_SIGN_UP_USERNAME}      User