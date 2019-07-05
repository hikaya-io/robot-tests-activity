*** Settings ***
Documentation                       This test suite tests the Add New Program Pop-Ups Displayed from different pages.
Library	                            SeleniumLibrary
Resource                            ../../Resources/common_resource.robot
Suite Setup   	                    Login To Landing Page
Suite Teardown                      Close Browser

*** Test Cases ***
Validate Adding a New Program Modal (Home Page Button)
    [Tags]                          add_program
    Click Element                   //button[@data-target="#addProgramModal"]
    Add Program Modal Should Be Displayed
    Click Element                   //button[@data-dismiss="modal"]
    Add/Create Program/Objective/Project Modal is Closed

Validate Adding a New Program Modal (Programs Page Button)
    [Tags]                          add_program
    Click navbar Sub-Item           partial link:Workflow               link:Programs
    Programs Page Should Be Displayed
    Click Element                   //button[@data-target="#addProgramModal"]
    Add Program Modal Should Be Displayed
    Click Element                   //button[@data-dismiss="modal"]
    Add/Create Program/Objective/Project Modal is Closed

Validate Creating a New Project Modal
    Click navbar Sub-Item           partial link:Workflow               link:Projects
    Program Index Page Should Be Displayed
    Click Element                   //button[@data-target="#addProjectModal"]
    Create Project Modal Should Be Displayed
    Click Element                   //button[@data-dismiss="modal"]
    Add/Create Program/Objective/Project Modal is Closed
 
Validate Adding a New Training Form
    Click navbar Sub-Item           partial link:Form Library           link:Training
    Training List Page Should Be Displayed
    Click Element                    //a[@href="/formlibrary/training_add/0/"]
    Add New Training Form Should Be Displayed
 
Validate Adding a New Distribution Form
    Click navbar Sub-Item           partial link:Form Library           link:Distributions
    Distribution List Page Should Be Displayed
    Click Element                    //a[@href="/formlibrary/distribution_add/0/"]
    Add New Distribution Form Should Be Displayed

Validate Adding a New Beneficiary Form
    Click navbar Sub-Item           partial link:Form Library           link:Beneficiaries
    Beneficiary List Page Should Be Displayed
    Click Element                    //a[@href="/formlibrary/beneficiary_add/0/"]
    Add New Beneficiary Form Should Be Displayed
Validate Adding a New Site Profile Form
    Click navbar Sub-Item           partial link:Components             link:Locations (Sites)
    Site Profile List Page Should Be Displayed
    Click Element                    //a[@href="/workflow/siteprofile_add"]
    Add Site Profile (Profile Tab) Form Should Be Displayed
    Click Element                    //a[@href="#location"]
    Add Site Profile (Location Tab) Form Should Be Displayed
    Click Element                    //a[@href="#demographic-information"]
    Add Site Profile (Demographic Information Tab) Form Should Be Displayed

Validate Adding a New Stakeholder Form
    Click navbar Sub-Item           partial link:Components             link:Stakeholders (Orgs)
    Stakeholder List Page Should Be Displayed
    Click Element                    //a[@href="/workflow/stakeholder_add/0/"]
    Add Stakeholder (Details Tab) Form Should Be Displayed
    Click Element                    //a[@href="#approvals"]
    Add Stakeholder (Approvals Tab) Form Should Be Displayed

#Validate Adding a New Contact Form
#    Click navbar Sub-Item           partial link:Components             link:Contacts
#    Contacts List Page Should Be Displayed
#    Click Element                    //a[@href="/workflow/contact_add//0/"]

Validate Adding a New Objective Modal
    Click navbar Sub-Item           partial link:Components             link:Objectives
    Objectives List Page Should Be Displayed
    Click Element                   //button[@data-target="#addObjectiveModal"]
    Add Objective Modal Should Be Displayed
    Click Element                   //button[@data-dismiss="modal"]
    Add/Create Program/Objective/Project Modal is Closed