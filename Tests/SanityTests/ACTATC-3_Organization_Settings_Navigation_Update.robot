*** Settings ***
Documentation     [TODO] Document this TestSuite
Resource          ../../Resources/CommonKeywords.resource
Resource          ../../Resources/OrganizationSettingsKeywords.resource
Suite Setup       Launch Activity Application
Suite Teardown    Close All Browsers

*** Variable ***

*** Test Case ***
ACTATC-3.1 Profile Page Update
    Login with Valid Credentials                ${OA_USERNAME}                   ${ACT_PASS}
    Display ACT Page Using DropDown             ${hl_user_popup}                 ${hl_user_org_settings}          ${lbl_org_settings_title}
    ${Current Org name}                         Get Value                        ${tb_org_name}
    ${Current Org desc}                         Get Value                        ${tb_org_desc}
    Choose File                                 ${tb_org_logo}                   ${FBH LOGO}
    Input ACT Textbox                           ${tb_org_name}                   ${Current Org name} Updated
    Input ACT Textbox                           ${tb_org_desc}                   ${Current Org desc} Updated
    Click ACT Element                           ${btn_org_save}
    Wait Until Page Contains Element            ${pnl_alerts_container}
    Element Should Contain                      ${pnl_alerts_container}          ${txt_org_logo_updated}
    Page Should Contain Element                 ${img_org_brand_logo}
    Page Should Contain Element                 ${img_profile_org_logo}
    Page Should Contain Element                 ${btn_reset}
    Display ACT Page                            ${hl_org_brand}                  ${lbl_dashboard_title}
    Click ACT Element                           ${hl_user_popup}
    Page Should Contain                         ${Current Org name} Updated
    Display ACT Page                            ${hl_user_org_settings}          ${lbl_org_settings_title}
    Input ACT Textbox                           ${tb_org_name}                   ${Current Org name}
    Input ACT Textbox                           ${tb_org_desc}                   ${Current Org desc}
    Click ACT Element                           ${btn_reset}
    Wait Until Page Contains Element            ${pnl_alerts_container}
    Element Should Contain                      ${pnl_alerts_container}          ${txt_org_logo_updated}
    Page Should Contain Element                 ${lbl_org_brand_default}
    Page Should Not Contain Element             ${img_org_brand_logo}
    Page Should Not Contain Element             ${img_profile_org_logo}
    Page Should Not Contain Element             ${btn_reset}

ACTATC-3.2 Configurations Page Update
    Display ACT Page                            ${hl_tab_configurations}         ${lbl_bc_configurations}
    ${Current WL1}                              Get Value                        ${tb_workflowlevel1}
    ${Current WL2}                              Get Value                        ${tb_workflowlevel2}
    ${Current WL3}                              Get Value                        ${tb_workflowlevel3}
    ${Current WL4}                              Get Value                        ${tb_workflowlevel4}
    ${Current Indicator}                        Get Value                        ${tb_indicator}
    ${Current Site}                             Get Value                        ${tb_site}
    ${Current Stakeholder}                      Get Value                        ${tb_stakeholder}
    ${Current Form}                             Get Value                        ${tb_form}
    Input ACT Textbox                           ${tb_workflowlevel1}             ${Current WL1} Update
    Input ACT Textbox                           ${tb_workflowlevel2}             ${Current WL2} Update
    Input ACT Textbox                           ${tb_workflowlevel3}             ${Current WL3} Update
    Input ACT Textbox                           ${tb_workflowlevel4}             ${Current WL4} Update
    Input ACT Textbox                           ${tb_indicator}                  ${Current Indicator} Update
    Input ACT Textbox                           ${tb_site}                       ${Current Site} Update
    Input ACT Textbox                           ${tb_stakeholder}                ${Current Stakeholder} Update
    Input ACT Textbox                           ${tb_form}                       ${Current Form} Update
    Click ACT Element Using JavaScript          ${btn_save}
    Wait Until Page Contains Element            ${pnl_toast}
    Element Text Should Be                      ${lbl_toast_title}               ${txt_toast_update_title}
    Element Text Should Be                      ${lbl_toast_message}             ${txt_toast_update_msg}
    Wait Until Page Does Not Contain Element    ${pnl_toast}
    Click ACT Element                           ${hl_workflows}
    Page Should Contain                         ${Current WL1} Update
    Page Should Contain                         ${Current WL2} Update
    Click ACT Element                           ${hl_indicators}
    Page Should Contain                         ${Current Indicator} Update
    Click ACT Element                           ${hl_components}
    Page Should Contain                         ${Current Site} Update
    Page Should Contain                         ${Current Stakeholder} Update
    Input ACT Textbox                           ${tb_workflowlevel1}             ${Current WL1}
    Input ACT Textbox                           ${tb_workflowlevel2}             ${Current WL2}
    Input ACT Textbox                           ${tb_workflowlevel3}             ${Current WL3}
    Input ACT Textbox                           ${tb_workflowlevel4}             ${Current WL4}
    Input ACT Textbox                           ${tb_indicator}                  ${Current Indicator}
    Input ACT Textbox                           ${tb_site}                       ${Current Site}
    Input ACT Textbox                           ${tb_stakeholder}                ${Current Stakeholder}
    Input ACT Textbox                           ${tb_form}                       ${Current Form}
    Click ACT Element Using JavaScript          ${btn_save}
    Wait Until Page Contains Element            ${pnl_toast}
    Element Text Should Be                      ${lbl_toast_title}               ${txt_toast_update_title}
    Element Text Should Be                      ${lbl_toast_message}             ${txt_toast_update_msg}
    Wait Until Page Does Not Contain Element    ${pnl_toast}

