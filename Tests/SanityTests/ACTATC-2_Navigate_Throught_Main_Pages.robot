*** Settings ***
Documentation                [TODO] Document this TestSuite
Resource                     ../../Resources/CommonKeywords.resource
Variables                    ../../PageObjects/WorkflowsPage.py
Variables                    ../../PageObjects/IndicatorsPage.py
Variables                    ../../PageObjects/FormLibraryPage.py
Variables                    ../../PageObjects/ComponentsPage.py
Variables                    ../../PageObjects/ReportsPage.py
Suite Setup                  Launch Activity Application
Suite Teardown               Close All Browsers

*** Variable ***
@{Program Elements}          ${btn_add_programs}                        ${tb_search_data_table}       ${tbl_programs}
@{Projects Elements}         ${btn_add_projects}                        ${btn_programs_filter}        ${btn_projects_status_filter}    ${tb_search_data_table}       ${tbl_projects}
@{Indicators Elements}       ${btn_add_indicators}                      ${btn_programs_filter}        ${tb_search_data_table}          ${tbl_indicators}
@{Objectives Elements}       ${btn_add_objectives}                      ${btn_list_view}              ${btn_tree_view}                 ${tb_search_data_table}       ${tbl_objectives}
@{Beneficiaries Elements}    ${btn_add_beneficiaries}                   ${btn_programs_filter}        ${btn_training_filter}           ${btn_distribution_filter}    ${tb_search_data_table}    ${tbl_beneficiaries}
@{Distributions Elements}    ${btn_add_distributions}                   ${btn_programs_filter}        ${btn_projects_filter}           ${tb_search_data_table}       ${tbl_distributions}
@{Trainings Elements}        ${btn_add_trainings}                       ${btn_programs_filter}        ${btn_projects_filter}           ${tb_search_data_table}       ${tbl_trainings}
@{Contacts Elements}         ${btn_add_contacts}                        ${btn_stakeholders_filter}    ${tb_search_data_table}          ${tbl_contacts}
@{Documents Elements}        ${btn_add_documents}                       ${btn_programs_filter}        ${btn_projects_filter}           ${tb_search_data_table}       ${tbl_documents}
@{Locations Elements}        ${btn_add_locations}                       ${btn_list_view}              ${btn_map_view}                  ${btn_programs_filter}        ${btn_projects_filter}     ${tb_search_data_table}    ${tbl_locations}
@{Stakeholders Elements}     ${btn_add_stakeholders}                    ${btn_programs_filter}        ${btn_projects_filter}           ${tb_search_data_table}       ${tbl_stakeholders}
@{Dashboards Elements}       ${btn_sectors_filter}                      ${btn_countries_filter}       ${tb_search_data_table}          ${tbl_dashboards}

*** Test Case ***
ACTATC-2.1 Display Workflows Pages
    Login with Valid Credentials           ${OA_USERNAME}               ${ACT_PASS}
    Display ACT Page Using DropDown        ${hl_workflows}              ${hl_wf_programs}          ${lbl_programs_title}
    ACT Page Contains Multiple Elements    ${Program Elements}
    Display ACT Page Using DropDown        ${hl_workflows}              ${hl_wf_projects}          ${lbl_projects_title}
    ACT Page Contains Multiple Elements    ${Projects Elements}

ACTATC-2.2 Display Indicators Pages
    Display ACT Page Using DropDown        ${hl_indicators}             ${hl_ind_indicators}       ${lbl_indicators_title}
    ACT Page Contains Multiple Elements    ${Indicators Elements}
    Display ACT Page Using DropDown        ${hl_indicators}             ${hl_ind_objectives}       ${lbl_objectives_title}
    ACT Page Contains Multiple Elements    ${Objectives Elements}

ACTATC-2.3 Display Form Library Pages
    Display ACT Page Using DropDown        ${hl_form_library}           ${hl_fl_beneficiaries}     ${lbl_beneficiaries_title}
    ACT Page Contains Multiple Elements    ${Beneficiaries Elements}
    Display ACT Page Using DropDown        ${hl_form_library}           ${hl_fl_ditributions}      ${lbl_distributions_title}
    ACT Page Contains Multiple Elements    ${Distributions Elements}
    Display ACT Page Using DropDown        ${hl_form_library}           ${hl_fl_trainings}         ${lbl_trainings_title}
    ACT Page Contains Multiple Elements    ${Trainings Elements}

ACTATC-2.4 Display Components Pages
    Display ACT Page Using DropDown        ${hl_components}             ${hl_comp_contacts}        ${lbl_contacts_title}
    ACT Page Contains Multiple Elements    ${Contacts Elements}
    Display ACT Page Using DropDown        ${hl_components}             ${hl_comp_documents}       ${lbl_documents_title}
    ACT Page Contains Multiple Elements    ${Documents Elements}
    Display ACT Page Using DropDown        ${hl_components}             ${hl_comp_locations}       ${lbl_locations_title}
    ACT Page Contains Multiple Elements    ${Locations Elements}
    Display ACT Page Using DropDown        ${hl_components}             ${hl_comp_stakeholders}    ${lbl_stakeholders_title}
    ACT Page Contains Multiple Elements    ${Stakeholders Elements}

ACTATC-2.5 Display Reports Pages
    Display ACT Page Using DropDown        ${hl_reports}                ${hl_rpt_dashboards}       ${lbl_dashboards_title}
    ACT Page Contains Multiple Elements    ${Dashboards Elements}
