*** Settings ***    
Documentation                           This resource file contains reusable
...                                     keywords and variables for the Smoke
...                                     Test Suite for ACtivity-CE 
Library                                 SeleniumLibrary

*** Variables ***                       
${BASE URL}                             http://activity-dev.hikaya.io/
${VALID USER}                           amos
${VALID PASSWORD}                       hikayaQA2019

${BROWSER}                              Chrome  # Firefox
${DELAY}                                0.05

*** Keywords ***
Open Browser To Login Page
    Open Browser	                    ${BASE_URL}                  browser=${BROWSER}
    Maximize Browser Window         
    Set Selenium Speed                  ${DELAY}                            
    Login Page Should Be Open

Login
    [Arguments]	                        ${username}	                  ${password}               
    Input Text                          login_username                ${username}
    Input Password                      login_password                ${password}
    Click Button                        login_submit_btn
    
Login With Valid Credentials
    Login                               ${VALID USER}	              ${VALID PASSWORD}
    Activity Dashboard Should Be Open

Login To Landing Page
    Open Browser To Login Page
    Login With Valid Credentials
                        
Logout
    Click Element                       user-initial
    Click Element                       //a[@href="/accounts/logout/"]
    Login Page Should Be Open
    
Login Page Should Be Open                           
    Element Text Should Be              tag:h1                          Login                                                

Click navbar Sub-Item
    [Arguments]                         ${dropdown_menu}                ${dropdown_menu_item}
    Click Element                       ${dropdown_menu}
    Click Element                       ${dropdown_menu_item}

Click navbar User_Initial
    [Arguments]                         ${dropdown_menu_item}
    Click Element                       user-initial
    Click Element                       ${dropdown_menu_item}

Activity Dashboard Should Be Open
    Location Should Be                  ${BASE URL}
    Element Text Should Be              class:page-title                Activity Dashboard
    Element Text Should Be              //button[@data-target="#addProgramModal"]           Add New Program

Program Index Page Should Be Displayed 
    Element Text Should Be              class:page-title                Program Index
    Element Text Should Be              //button[@data-target="#addProjectModal"]           Create New Project

Programs Page Should Be Displayed
    Element Text Should Be              class:page-title                Programs
    Element Text Should Be              //button[@data-target="#addProgramModal"]           Add New Program

Training List Page Should Be Displayed
    Element Text Should Be              class:page-title                Training List
    Element Text Should Be              //a[@href="/formlibrary/training_add/0/"]           New Training

Distribution List Page Should Be Displayed
    Element Text Should Be              class:page-title                Distribution List
    Element Text Should Be              //a[@href="/formlibrary/distribution_add/0/"]       New Distribution

Beneficiary List Page Should Be Displayed
    Element Text Should Be              class:page-title                Beneficiary List
    Element Text Should Be              //a[@href="/formlibrary/beneficiary_add/0/"]        New Beneficiary

Site Profile List Page Should Be Displayed
    Element Text Should Be              class:page-title                Site Profile List
    Element Text Should Be              //a[@href="/workflow/siteprofile_add"]              New Site Profile

Stakeholder List Page Should Be Displayed
    Element Text Should Be              class:page-title                Stakeholder List
    Element Text Should Be              //a[@href="/workflow/stakeholder_add/0/"]           New Stakeholder

Documents List Page Should Be Displayed
    Element Text Should Be              class:page-title                Documentation List

Contacts List Page Should Be Displayed
    Element Text Should Be          class:page-title                                        Contacts
    Element Text Should Be          //a[@href="/workflow/contact_add//0/"]                  New Contact

Objectives List Page Should Be Displayed
    Element Text Should Be              class:page-title                Objectives
    Element Text Should Be              //button[@data-target="#addObjectiveModal"]         Add New Objective
    
Program Reports Page Should Be Displayed
    Element Text Should Be              class:page-title                Program Reports
    Element Text Should Be              //div[@id="welcome-panel"]/div[1]                   Program Filter Reports
    Page Should Contain Button          submit-id-submit
    Page Should Contain Button          id_search_form_reset_btn
    Element Text Should Be              welcome                         Filter your search in the panel on the left to see results.

Public Dashboards Page Should Be Displayed
    Element Text Should Be              class:page-title                Public Dashboards

Project Report Page Should Be Displayed
    Element Text Should Be              class:page-title                Project Report

Collected Indicator Data Page Should Be Displayed
    Element Text Should Be              class:page-title                Collected Indicator Data
    
Indicator Report Page Should Be Displayed
    Element Text Should Be              class:page-title                Indicator Report
    
Indicator Libray Report Page Should Be Displayed
    Element Text Should Be              class:page-title                Indicator Libray Report
    
Indicator Targets vs Actuals Report Page Should Be Displayed
    Element Text Should Be              class:page-title                Indicator Targets vs Actuals Report
    
Indicator Disaggregation Report Page Should Be Displayed
    Element Text Should Be              class:page-title                Indicator Disaggregation Report

Profile Page Should Be Displayed        
    Element Text Should Be          class:page-title                                            User Registration/Profile
    Element Text Should Be          //div[@id="div_id_title"]/label                             Title
    Element Text Should Be          //label[@for="id_name"]                                     Given Name
    Page Should Contain Textfield   id_name 
    Element Text Should Be          //label[@for="id_employee_number"]                          Employee Number
    Page Should Contain Textfield   id_employee_number  
    Element Text Should Be          //label[@for="id_user"]                                     User*
    Element Text Should Be          //label[@for="id_country"]                                  Country
    Element Text Should Be          //label[@for="id_countries"]                                Accessible Countries
    Page Should Contain Button      submit-id-submit
    Page Should Contain Button      reset-id-reset

Admin Dashboard Should Be Displayed
    Location Should Be              ${BASE URL}accounts/admin_dashboard/
    Element Attribute Value Should Be   (//li[@role="presentation"])[1]         class           hikaya-active
    Element Text Should Be          //div[@class="side-nav"]/h2                                 Dashboard
    Element Text Should Be          (//ul[@class="nav nav-pills nav-stacked"]/li/a)[1]          Home
    Element Text Should Be          (//div[@class="panel-heading"])[1]                          Workflowlevel1 Summary (Status)
    Element Text Should Be          (//div[@class="panel-heading"])[2]                          Workflowlevel2 Summary (Status)
    Element Text Should Be          (//div[@class="panel-heading"])[3]                          Indicators Summary
    Element Text Should Be          (//div[@class="panel-heading"])[4]                          Sites By Country

Profile Settings Page Should Be Displayed
    Location Should Be              ${BASE URL}accounts/admin/profile_settings    
    Element Attribute Value Should Be   (//li[@role="presentation"])[2]         class           hikaya-active
    Element Text Should Be          (//ul[@class="nav nav-pills nav-stacked"]/li/a)[2]          Profile Settings
    Page Should Contain Checkbox    logo-clear_id
    Page Should Contain Button      submit-id-submit
    Page Should Contain Button      id_logo

Configurations Page Should Be Displayed
    Location Should Be              ${BASE URL}accounts/admin/configurations
    Element Attribute Value Should Be   (//li[@role="presentation"])[3]         class           hikaya-active
    Element Text Should Be          (//ul[@class="nav nav-pills nav-stacked"]/li/a)[3]          Configurations
    Element Text Should Be          //button[@class="btn hikaya-btn-cancel"]                    Discard Changes
    Element Text Should Be          //button[@class="btn btn-success"]                          Save Changes
    Element Text Should Be          (//div[@class="panel-heading"])[1]                          Workflow Level Labels
    Element Text Should Be          (//div[@class="panel-heading"])[2]                          Other Labels
    Element Text Should Be          (//div[@class="panel-heading"])[3]                          Default Settings
    
User Management Page Should Be Displayed
    Location Should Be              ${BASE URL}accounts/admin/users
    Element Attribute Value Should Be   (//li[@role="presentation"])[4]         class           hikaya-active
    Element Text Should Be          (//table[@class="table table-striped"]/thead/tr/th)[1]      First Name
    Element Text Should Be          (//table[@class="table table-striped"]/thead/tr/th)[2]      Last Name
    Element Text Should Be          (//table[@class="table table-striped"]/thead/tr/th)[3]      User Status
    Element Text Should Be          (//table[@class="table table-striped"]/thead/tr/th)[4]      Role
    Element Text Should Be          (//table[@class="table table-striped"]/thead/tr/th)[5]      Date Joined    

Add Program Modal Should Be Displayed
    Wait Until Element is Visible   class:modal-dialog
    Element Text Should Be          addProgramModalLabel                                        Add Program
    Element Text Should Be          //label[@for="programName"]                                 Program Name
    Page Should Contain Textfield   name:program_name
    Element Text Should Be          //label[@for="sectors"]                                     Sectors
    Element Text Should Be          //label[@for="startDate"]                                   Start Date
    Page Should Contain Textfield   name:start_date
    Element Text Should Be          //label[@for="endDate"]                                     End Date
    Page Should Contain Textfield   name:end_date
    Page Should Contain Button      //button[@data-dismiss="modal"]
    Page Should Contain Button      saveProgram

Create Project Modal Should Be Displayed
    Wait Until Element is Visible   class:modal-dialog
    Element Text Should Be          addProjectModalLabel                                        Create WorkflowLevel2
    Element Text Should Be          //label[@for="program"]                                     Program
    Element Text Should Be          //label[@for="project_name"]                                Project Name
    Page Should Contain Textfield   name:project_name
    Page Should Contain Button      //button[@data-dismiss="modal"]
    Page Should Contain Button      submitProject
    
Add/Create Program/Objective/Project Modal is Closed  
    Wait Until Element is Not Visible   class:modal-dialog

Add New Training Form Should Be Displayed
    Location Should Be              ${BASE URL}formlibrary/training_add/0/
    Element Text Should Be          //div[@class="sub-navigation-header"]/h4                    TrainingAttendence Form 
    Element Text Should Be          //label[@for="id_training_name"]                            Training name*
    Page Should Contain Textfield   name:training_name
    Element Text Should Be          //label[@for="id_program"]                                  Program
    Element Text Should Be          //label[@for="id_project_agreement"]                        Project Initiation
    Element Text Should Be          //label[@for="id_implementer"]                              Implementer
    Page Should Contain Textfield   id_implementer
    Element Text Should Be          //label[@for="id_reporting_period"]                         Reporting period
    Page Should Contain Textfield   id_reporting_period
    Element Text Should Be          //label[@for="id_total_participants"]                       Total participants
    Page Should Contain Textfield   id_total_participants
    Element Text Should Be          //label[@for="id_location"]                                 Location
    Page Should Contain Textfield   id_location
    Element Text Should Be          //label[@for="id_community"]                                Community
    Page Should Contain Textfield   id_community
    Element Text Should Be          //label[@for="id_training_duration"]                        Training duration
    Page Should Contain Textfield   id_training_duration
    Element Text Should Be          //label[@for="id_start_date"]                               Start date
    Page Should Contain Textfield   id_start_date
    Element Text Should Be          //label[@for="id_end_date"]                                 End date
    Page Should Contain Textfield   id_end_date
    Element Text Should Be          //label[@for="id_trainer_name"]                             Trainer name
    Page Should Contain Textfield   id_trainer_name
    Element Text Should Be          //label[@for="id_trainer_contact_num"]                      Trainer contact num
    Page Should Contain Textfield   id_trainer_contact_num
    Element Text Should Be          //label[@for="id_form_filled_by"]                           Form filled by
    Page Should Contain Textfield   id_form_filled_by
    Element Text Should Be          //label[@for="id_form_filled_by_contact_num"]               Form filled by contact num
    Page Should Contain Textfield   id_form_filled_by_contact_num
    Element Text Should Be          //label[@for="id_total_male"]                               Total male
    Page Should Contain Textfield   id_total_male
    Element Text Should Be          //label[@for="id_total_female"]                             Total female
    Page Should Contain Textfield   id_total_female
    Element Text Should Be          //label[@for="id_total_age_0_14_male"]                      Total age 0 14 male
    Page Should Contain Textfield   id_total_age_0_14_male
    Element Text Should Be          //label[@for="id_total_age_0_14_female"]                    Total age 0 14 female
    Page Should Contain Textfield   id_total_age_0_14_female
    Element Text Should Be          //label[@for="id_total_age_15_24_male"]                     Total age 15 24 male
    Page Should Contain Textfield   id_total_age_15_24_male
    Element Text Should Be          //label[@for="id_total_age_15_24_female"]                   Total age 15 24 female
    Page Should Contain Textfield   id_total_age_15_24_female
    Element Text Should Be          //label[@for="id_total_age_25_59_male"]                     Total age 25 59 male
    Page Should Contain Textfield   id_total_age_25_59_male
    Element Text Should Be          //label[@for="id_total_age_25_59_female"]                   Total age 25 59 female
    Page Should Contain Textfield   id_total_age_25_59_male
    Page Should Contain Button      submit-id-submit

Add New Distribution Form Should Be Displayed
    Location Should Be              ${BASE URL}formlibrary/distribution_add/0/
    Element Text Should Be          //div[@class="container"]/h1                                Distribution Form 
    Element Text Should Be          //label[@for="id_distribution_name"]                        Distribution name*
    Page Should Contain Textfield   name:distribution_name
    Element Text Should Be          //label[@for="id_program"]                                  Program
    Element Text Should Be          //label[@for="id_initiation"]                               Project Initiation
    Element Text Should Be          //label[@for="id_office_code"]                              Office code
    Element Text Should Be          //label[@for="id_distribution_indicator"]                   Distribution indicator*
    Page Should Contain Textfield   name:distribution_indicator
    Element Text Should Be          //label[@for="id_distribution_implementer"]                 Distribution implementer
    Page Should Contain Textfield   name:distribution_implementer
    Element Text Should Be          //label[@for="id_reporting_period"]                         Reporting period
    Page Should Contain Textfield   name:reporting_period
    Element Text Should Be          //label[@for="id_province"]                                 Province
    Element Text Should Be          //label[@for="id_total_beneficiaries_received_input"]       Total beneficiaries received input
    Page Should Contain Textfield   name:total_beneficiaries_received_input
    Element Text Should Be          //label[@for="id_distribution_location"]                    Distribution location
    Page Should Contain Textfield   name:distribution_location
    Element Text Should Be          //label[@for="id_input_type_distributed"]                   Input type distributed
    Page Should Contain Textfield   name:input_type_distributed
    Element Text Should Be          //label[@for="id_distributor_name_and_affiliation"]         Distributor name and affiliation
    Page Should Contain Textfield   name:distributor_name_and_affiliation
    Element Text Should Be          //label[@for="id_distributor_contact_number"]               Distributor contact number
    Page Should Contain Textfield   name:distributor_contact_number
    Element Text Should Be          //label[@for="id_end_date"]                                 End date
    Page Should Contain Textfield   name:end_date
    Element Text Should Be          //label[@for="id_form_filled_by"]                           Form filled by
    Page Should Contain Textfield   name:form_filled_by
    Element Text Should Be          //label[@for="id_form_filled_by_position"]                  Form filled by position
    Page Should Contain Textfield   name:form_filled_by_position
    Element Text Should Be          //label[@for="id_form_filled_by_contact_num"]               Form filled by contact num
    Page Should Contain Textfield   name:form_filled_by_contact_num
    Element Text Should Be          //label[@for="id_form_filled_date"]                         Form filled date
    Page Should Contain Textfield   name:form_filled_date
    Element Text Should Be          //label[@for="id_form_verified_by"]                         Form verified by
    Page Should Contain Textfield   name:form_verified_by
    Element Text Should Be          //label[@for="id_form_verified_by_position"]                Form verified by position
    Page Should Contain Textfield   name:form_verified_by_position
    Element Text Should Be          //label[@for="id_form_verified_by_contact_num"]             Form verified by contact num
    Page Should Contain Textfield   name:form_verified_by_contact_num
    Element Text Should Be          //label[@for="id_form_verified_date"]                       Form verified date
    Page Should Contain Textfield   name:form_verified_date
    Element Text Should Be          //label[@for="id_total_received_input"]                     Total received input
    Page Should Contain Textfield   name:total_received_input
    Element Text Should Be          //label[@for="id_total_male"]                               Total male
    Page Should Contain Textfield   name:total_male
    Element Text Should Be          //label[@for="id_total_female"]                             Total female
    Page Should Contain Textfield   name:total_female
    Element Text Should Be          //label[@for="id_total_age_0_14_male"]                      Total age 0 14 male
    Page Should Contain Textfield   name:total_age_0_14_male
    Element Text Should Be          //label[@for="id_total_age_0_14_female"]                    Total age 0 14 female
    Page Should Contain Textfield   name:total_age_0_14_female
    Element Text Should Be          //label[@for="id_total_age_15_24_male"]                     Total age 15 24 male
    Page Should Contain Textfield   name:total_age_15_24_male
    Element Text Should Be          //label[@for="id_total_age_15_24_female"]                   Total age 15 24 female
    Page Should Contain Textfield   name:total_age_15_24_female
    Element Text Should Be          //label[@for="id_total_age_25_59_male"]                     Total age 25 59 male
    Page Should Contain Textfield   name:total_age_25_59_male
    Element Text Should Be          //label[@for="id_total_age_25_59_female"]                   Total age 25 59 female
    Page Should Contain Textfield   name:total_age_25_59_male
    Page Should Contain Button      submit-id-submit

Add New Beneficiary Form Should Be Displayed
    Location Should Be              ${BASE URL}formlibrary/beneficiary_add/0/
    Element Text Should Be          //div[@class="container"]/h1                                Beneficiary Form 
    Element Text Should Be          //label[@for="id_beneficiary_name"]                         Beneficiary name
    Page Should Contain Textfield   name:beneficiary_name
    Element Text Should Be          //label[@for="id_training"]                                 Training
    Element Text Should Be          //label[@for="id_distribution"]                             Distribution
    Element Text Should Be          //label[@for="id_father_name"]                              Father name
    Page Should Contain Textfield   name:father_name
    Element Text Should Be          //label[@for="id_age"]                                      Age
    Page Should Contain Textfield   name:age
    Element Text Should Be          //label[@for="id_gender"]                                   Gender
    Page Should Contain Textfield   name:gender
    Element Text Should Be          //label[@for="id_site"]                                     Site
    Page Should Contain Checkbox    id_signature
    Element Text Should Be          //label[@for="id_signature"]                                Signature
    Element Text Should Be          //label[@for="id_remarks"]                                  Remarks
    Page Should Contain Textfield   name:remarks
    Element Text Should Be          //label[@for="id_program"]                                  Program
    Page Should Contain Button      submit-id-submit

Add Site Profile (Profile Tab) Form Should Be Displayed
    Location Should Be              ${BASE URL}workflow/siteprofile_add
    Element Text Should Be          (//div[@id="profile"]/fieldset/legend)[1]                            Description
    Element Text Should Be          //label[@for="id_name"]                                     Site Name*
    Page Should Contain Textfield   name:name
    Element Text Should Be          //label[@for="id_type"]                                     Type
    Element Text Should Be          //label[@for="id_office"]                                   Office
    Page Should Contain Checkbox    id_status
    Element Text Should Be          //label[@for="id_status"]                                   Site Active
    Element Text Should Be          (//div[@id="profile"]/fieldset/legend)[2]                            Contact Info
    Element Text Should Be          //label[@for="id_contact_leader"]                           Contact Name
    Page Should Contain Textfield   name:contact_leader
    Element Text Should Be          //label[@for="id_date_of_firstcontact"]                     Date of First Contact
    Page Should Contain Textfield   name:date_of_firstcontact
    Element Text Should Be          //label[@for="id_contact_number"]                           Contact Number
    Page Should Contain Textfield   name:contact_number
    Element Text Should Be          //label[@for="id_num_members"]                              Number of Members
    Page Should Contain Textfield   name:num_members
    Page Should Contain Button      submit-id-submit
    Page Should Contain Button      reset-id-reset

Add Site Profile (Location Tab) Form Should Be Displayed
    Location Should Be              ${BASE URL}workflow/siteprofile_add#location
    Element Text Should Be          (//div[@id="location"]/fieldset/legend)[1]                            Places
    Element Text Should Be          //label[@for="id_country"]                                  Country
    Element Text Should Be          //label[@for="id_province"]                                 Administrative Level 1
    Element Text Should Be          //label[@for="id_district"]                                 Administrative Level 2
    Element Text Should Be          //label[@for="id_admin_level_three"]                        Administrative Level 3
    Element Text Should Be          //label[@for="id_village"]                                  Administrative Level 4
    Page Should Contain Textfield   name:village
    Element Text Should Be          //label[@for="id_latitude"]                                 Latitude (Decimal Coordinates)*
    Page Should Contain Textfield   name:latitude
    Element Text Should Be          //label[@for="id_longitude"]                                Longitude (Decimal Coordinates)*
    Page Should Contain Textfield   name:longitude
    Element Text Should Be          (//div[@id="location"]/fieldset/legend)[2]                  Map
    Element Text Should Be          //label[@for="city_county"]                                 City, Country:
    Page Should Contain Textfield   city_country
    Page Should Contain Button      (//div[@id="search"]/input)[2]                              
    Page Should Contain Button      submit-id-submit
    Page Should Contain Button      reset-id-reset

Add Site Profile (Demographic Information Tab) Form Should Be Displayed
    Location Should Be              ${BASE URL}workflow/siteprofile_add#demographic-information
    Element Text Should Be          (//div[@id="demographic-information"]/fieldset/legend)[1]   Households
    Element Text Should Be          //label[@for="id_total_num_households"]                     Total # Households
    Page Should Contain Textfield   name:total_num_households
    Element Text Should Be          //label[@for="id_avg_household_size"]                       Average Household Size*
    Page Should Contain Textfield   name:avg_household_size
    Element Text Should Be          //label[@for="id_male_0_5"]                                 Male age 0-5
    Page Should Contain Textfield   name:male_0_5
    Element Text Should Be          //label[@for="id_female_0_5"]                               Female age 0-5
    Page Should Contain Textfield   name:female_0_5
    Element Text Should Be          //label[@for="id_male_6_9"]                                 Male age 6-9
    Page Should Contain Textfield   name:male_6_9
    Element Text Should Be          //label[@for="id_female_6_9"]                               Female age 6-9
    Page Should Contain Textfield   name:female_6_9
    Element Text Should Be          //label[@for="id_male_10_14"]                               Male age 10-14
    Page Should Contain Textfield   name:male_10_14
    Element Text Should Be          //label[@for="id_female_10_14"]                             Female age 10-14
    Page Should Contain Textfield   name:female_10_14
    Element Text Should Be          //label[@for="id_male_15_19"]                               Male age 15-19
    Page Should Contain Textfield   name:male_15_19
    Element Text Should Be          //label[@for="id_female_15_19"]                             Female age 15-19
    Page Should Contain Textfield   name:female_15_19
    Element Text Should Be          //label[@for="id_male_20_24"]                               Male age 20-24
    Page Should Contain Textfield   name:male_20_24
    Element Text Should Be          //label[@for="id_female_20_24"]                             Female age 20-24
    Page Should Contain Textfield   name:female_20_24
    Element Text Should Be          //label[@for="id_male_25_34"]                               Male age 25-34
    Page Should Contain Textfield   name:male_25_34
    Element Text Should Be          //label[@for="id_female_25_34"]                             Female age 25-34
    Page Should Contain Textfield   name:female_25_34
    Element Text Should Be          //label[@for="id_male_35_49"]                               Male age 35-49
    Page Should Contain Textfield   name:male_35_49
    Element Text Should Be          //label[@for="id_female_35_49"]                             Female age 35-49
    Page Should Contain Textfield   name:female_35_49
    Element Text Should Be          //label[@for="id_male_over_50"]                             Male Over 50
    Page Should Contain Textfield   name:male_over_50
    Element Text Should Be          //label[@for="id_female_over_50"]                           Female Over 50
    Page Should Contain Textfield   name:female_over_50
    Element Text Should Be          //label[@for="id_total_population"]                         Total population
    Page Should Contain Textfield   name:total_population
    Element Text Should Be          (//div[@id="demographic-information"]/fieldset/legend)[2]   Land
    Element Text Should Be          //label[@for="id_classify_land"]                            Classify land
    Element Text Should Be          //label[@for="id_total_land"]                               Total Land
    Page Should Contain Textfield   name:total_land
    Element Text Should Be          //span[@id="hint_id_total_land"]                            In hectares/jeribs
    Element Text Should Be          //label[@for="id_total_agricultural_land"]                  Total Agricultural Land
    Page Should Contain Textfield   name:total_agricultural_land
    Element Text Should Be          //span[@id="hint_id_total_agricultural_land"]               In hectares/jeribs
    Element Text Should Be          //label[@for="id_total_rainfed_land"]                       Total Rain-fed Land
    Page Should Contain Textfield   name:total_rainfed_land
    Element Text Should Be          //span[@id="hint_id_total_rainfed_land"]                    In hectares/jeribs
    Element Text Should Be          //label[@for="id_total_horticultural_land"]                 Total Horticultural Land
    Page Should Contain Textfield   name:total_horticultural_land
    Element Text Should Be          //span[@id="hint_id_total_horticultural_land"]              In hectares/jeribs
    Element Text Should Be          //label[@for="id_populations_owning_land"]                  Households Owning Land
    Page Should Contain Textfield   name:populations_owning_land
    Element Text Should Be          //span[@id="hint_id_populations_owning_land"]               (%)
    Element Text Should Be          //label[@for="id_avg_landholding_size"]                     Average Landholding Size*
    Page Should Contain Textfield   name:avg_landholding_size
    Element Text Should Be          //span[@id="hint_id_avg_landholding_size"]                  In hectares/jeribs
    Element Text Should Be          //label[@for="id_households_owning_livestock"]              Households Owning Livestock
    Page Should Contain Textfield   name:households_owning_livestock
    Element Text Should Be          //span[@id="hint_id_households_owning_livestock"]           (%)
    Element Text Should Be          //label[@for="id_animal_type"]                              Animal Types
    Page Should Contain Textfield   name:animal_type
    Element Text Should Be          //span[@id="hint_id_animal_type"]                           List Animal Types
    Element Text Should Be          (//div[@id="demographic-information"]/fieldset/legend)[3]   Literacy
    Element Text Should Be          //label[@for="id_literate_males"]                           % of Literate Males
    Page Should Contain Textfield   name:literate_males
    Element Text Should Be          //span[@id="hint_id_literate_males"]                        %
    Element Text Should Be          //label[@for="id_literate_females"]                         % of Literate Females
    Page Should Contain Textfield   name:literate_females
    Element Text Should Be          //span[@id="hint_id_literate_females"]                      %
    Element Text Should Be          //label[@for="id_literacy_rate"]                            Literacy Rate (%)
    Page Should Contain Textfield   name:literacy_rate
    Element Text Should Be          //span[@id="hint_id_literacy_rate"]                         %    
    Element Text Should Be          (//div[@id="demographic-information"]/fieldset/legend)[4]   Demographic Info Data Source
    Element Text Should Be          //label[@for="id_info_source"]                              Data Source
    Page Should Contain Textfield   name:info_source
    Page Should Contain Button      submit-id-submit
    Page Should Contain Button      reset-id-reset

Add Stakeholder (Details Tab) Form Should Be Displayed
    Location Should Be              ${BASE URL}workflow/stakeholder_add/0/
    Element Text Should Be          //div[@id="details"]/fieldset/legend                        Details
    Element Text Should Be          //label[@for="id_name"]                                     Stakeholder/Organization Name
    Page Should Contain Textfield   name:name
    Element Text Should Be          //label[@for="id_type"]                                     Type
    Page Should Contain Element     id_type
    Element Text Should Be          //label[@for="id_contact"]                                  Contact
    Element Text Should Be          //div[@id="details"]/fieldset/a                             Add New Contact
    Element Text Should Be          //label[@for="id_country"]                                  Country
    Page Should Contain Element     id_country
    Element Text Should Be          //label[@for="id_sectors"]                                  Sectors
    Element Text Should Be          //label[@for="id_stakeholder_register"]                     Has this partner been added to stakeholder register?
    Page Should Contain Checkbox    id_stakeholder_register
    Element Text Should Be          //label[@for="id_formal_relationship_document"]             Formal Written Description of Relationship
    Page Should Contain Element     //span[@id="select2-id_formal_relationship_document-container"]
    Element Text Should Be          //label[@for="id_vetting_document"]                         Vetting/ due diligence statement
    Page Should Contain Element     //span[@id="select2-id_vetting_document-container"]
    Element Text Should Be          //label[@for="id_notes"]                                    Notes
    Page Should Contain Element     id_notes
    Page Should Contain Button      submit-id-submit

Add Stakeholder (Approvals Tab) Form Should Be Displayed
    Location Should Be              ${BASE URL}workflow/stakeholder_add/0/#approvals
    Element Text Should Be          //div[@id="approvals"]/fieldset/legend                      Approval
    Element Text Should Be          //label[@for="id_approval"]                                 Approval
    Element Text Should Be          //label[@for="id_approved_by"]                              Approved by
    Element Text Should Be          //label[@for="id_filled_by"]                                Filled by
    Page Should Contain Button      submit-id-submit

Add Objective Modal Should Be Displayed
    Wait Until Element is Visible   class:modal-dialog
    Element Text Should Be          addProgramModalLabel                                        Add Objective
    Element Text Should Be          //label[@for="objectiveName"]                               Objective Name
    Page Should Contain Textfield   name:objective_name
    Element Text Should Be          //label[@for="parentObjective"]                             Parent Objective
    Element Text Should Be          //label[@for="objectiveDescription"]                        Description
    Page Should Contain Button      //button[@data-dismiss="modal"]
    Page Should Contain Button      saveObjective