*** Settings ***
Documentation    Organization Settings Page Keywords Resource File
...              This keywords resource file contains user keywords which define common
...              interations of elements in the Organization Settings page.
Variables        ../PageObjects/OrganizationSettingsPage.py

*** Keywords ***
Invite a User
    [Arguments]                         ${org}                                                                              @{users}
    Display ACT Page Using DropDown     ${btn_invite_users}                                                                 ${hl_invite_users}           ${lbl_invite_people_title}
    FOR                                 ${user}                                                                             IN                           @{users}
    Click ACT Element                   ${tb_email_address}
    Input ACT Textbox                   ${tb_email_address}                                                                 ${user}
    Press Keys                          None                                                                                RETURN
    Wait Until Page Contains Element    ${lbi_email_choice}\[@title="${user}"\]
    END
    Click ACT Element                   ${dd_invite_org}
    Click ACT Element                   ${org}
    Click ACT Element                   ${btn_invite}
    ${user_count}                       Get Length                                                                          ${users}
    Validate Toast Message              ${txt_toast_invite_msg}${user_count} user(s)                                        ${txt_toast_invite_title}

Resend Inviation
    [Arguments]                         ${email}
    Display ACT Page Using DropDown     ${btn_invite_users}                                                                 ${hl_pending_invite}         ${lbl_pending_invite_title}
    Display ACT Page Using DropDown     ${tbl_pending_invites}//td[contains(text(),"${email}")]/..${btn_toggle_dropdown}    ${hl_resend}                 ${lbl_confirm_revoke_title}
    Validate Toast Message              ${txt_toast_resend_invite_msg}

Revoke User Invitation
    [Arguments]                         ${email}
    Display ACT Page Using DropDown     ${btn_invite_users}                                                                 ${hl_pending_invite}         ${lbl_pending_invite_title}
    Display ACT Page Using DropDown     ${tbl_pending_invites}//td[contains(text(),"${email}")]/..${btn_toggle_dropdown}    ${hl_revoke}                 ${lbl_confirm_revoke_title}
    Click ACT Element                   ${btn_revoke}
    Validate Toast Message              ${txt_toast_revoke_invite_msg}
