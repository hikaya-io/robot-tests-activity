*** Settings ***
Documentation                       This test suites test the Main 
...                                 Landing page and child pages of 
...                                 the Activty-CE web application
Library	                            SeleniumLibrary
Resource                            ../../Resources/common_resource.robot
Suite Setup   	                    Login To Landing Page
Suite Teardown                      Close Browser

*** Test Cases ***
Validate WorkFlow Pages
    [Tags]                          landing    
    Click navbar Sub-Item           partial link:Workflow               link:Programs
    Programs Page Should Be Displayed
    Click navbar Sub-Item           partial link:Workflow               link:Projects
    Program Index Page Should Be Displayed

Validate Indicators Page
    [Tags]                          landing
    Click Element                   partial link:Indicators
    Element Text Should Be          class:page-title                    Program Indicators

Validate Form Library Pages
    Click navbar Sub-Item           partial link:Form Library           link:Training
    Training List Page Should Be Displayed
    Click navbar Sub-Item           partial link:Form Library           link:Distributions
    Distribution List Page Should Be Displayed
    Click navbar Sub-Item           partial link:Form Library           link:Beneficiaries
    Beneficiary List Page Should Be Displayed

Validate Components Page
    Click navbar Sub-Item           partial link:Components             link:Locations (Sites)
    Site Profile List Page Should Be Displayed
    Click navbar Sub-Item           partial link:Components             link:Stakeholders (Orgs)
    Stakeholder List Page Should Be Displayed
    Click navbar Sub-Item           partial link:Components           link:Contacts
    Contacts List Page Should Be Displayed
    Click navbar Sub-Item           partial link:Components             link:Documents
    Documents List Page Should Be Displayed
    Click navbar Sub-Item           partial link:Components             link:Objectives
    Objectives List Page Should Be Displayed
    
Validate Reports Page
    Click navbar Sub-Item           partial link:Reports                link:Program Report
    Program Reports Page Should Be Displayed
    Click navbar Sub-Item           partial link:Reports                link:Program Dashboards
    Public Dashboards Page Should Be Displayed
    Click navbar Sub-Item           partial link:Reports                link:Project Report
    Project Report Page Should Be Displayed
    Click navbar Sub-Item           partial link:Reports                link:Indicator Data Report
    Collected Indicator Data Page Should Be Displayed
    Click navbar Sub-Item           partial link:Reports                link:Indicator Visual Report
    Indicator Report Page Should Be Displayed
    Click navbar Sub-Item           partial link:Reports                link:Indicator Library
    Indicator Libray Report Page Should Be Displayed
    Click navbar Sub-Item           partial link:Reports                link:Target vs Actual Report
    Indicator Targets vs Actuals Report Page Should Be Displayed
    Click navbar Sub-Item           partial link:Reports                link:Indicator Disaggregation Report
    Indicator Disaggregation Report Page Should Be Displayed
    