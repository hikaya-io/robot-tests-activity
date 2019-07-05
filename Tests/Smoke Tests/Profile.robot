*** Settings ***
Documentation                       This test suite tests the Admin Dashboard, Profile Settings, Cofiguarations and the User Management pages.
Library	                            SeleniumLibrary
Resource                            ../../Resources/common_resource.robot
Suite Setup   	                    Login To Landing Page
Suite Teardown                      Close Browser

*** Test Cases ***
Validate the User Profile
    Click navbar User_Initial       //a[@href="/accounts/profile/"]
    Profile Page Should Be Displayed
   
Validate the Admin Dashboard
    Click navbar User_Initial       //a[@href="/accounts/admin_dashboard/"]
    Admin Dashboard Should Be Displayed 
    Click Element                   //a[@href="/accounts/admin/profile_settings"]
    Profile Settings Page Should Be Displayed 
    Click Element                   //a[@href="/accounts/admin/configurations"]
    Configurations Page Should Be Displayed
    Click Element                   //a[@href="/accounts/admin/users"]
    User Management Page Should Be Displayed