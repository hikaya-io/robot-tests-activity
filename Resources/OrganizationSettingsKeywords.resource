*** Settings ***
Documentation    Organization Settings Page Keywords Resource File
...              This keywords resource file contains user keywords which define common
...              interations of elements in the Organization Settings page.
Variables        ../PageObjects/OrganizationSettingsPage.py

*** Keywords ***
Invite a User
    [Arguments]                                 ${org}                                     @{users}
    Display ACT Page Using DropDown             ${btn_invite_users}                        ${hl_invite_users}                              ${lbl_invite_people_title}
    FOR                                         ${user}                                    IN                                              @{users}
    Click ACT Element                           ${tb_email_address}
    Input ACT Textbox                           ${tb_email_address}                        ${user}
    Press Keys                                  None                                       RETURN
    Wait Until Page Contains Element            ${lbi_email_choice}\[@title="${user}"\]
    END
    Click ACT Element                           ${dd_invite_org}
    Click ACT Element                           ${org}
    Click ACT Element                           ${btn_invite}
    Wait Until Page Contains Element            ${pnl_toast}
    Element Text Should Be                      ${lbl_toast_title}                         ${txt_toast_invite_title}
    ${user_count}                               Get Length                                 ${users}
    Element Text Should Be                      ${lbl_toast_message}                       ${txt_toast_invite_msg}${user_count} user(s)
    Wait Until Page Does Not Contain Element    ${pnl_toast}
    Wait Until Page Does Not Contain Element    ${lbl_org_settings_title}
