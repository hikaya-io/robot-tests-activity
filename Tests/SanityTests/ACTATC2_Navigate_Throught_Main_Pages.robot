*** Settings ***
Documentation       [TODO] Document this TestSuite
Library             Collections
Library             SeleniumLibrary
Resource            ../../Resources/CommonKeywords.resource
Variables           ../../PageObjects/CreateOrganizationPage.py
Suite Setup         Launch Activity Application                    ${BASE URL}    ${FIREFOX}
# Suite Teardown    Close All Browsers

*** Variable ***


*** Test Case ***
# Configure URLS
