*** Settings ***
Documentation                   This test suites test the login page of the Activty-CE web application
Library	                        SeleniumLibrary
Resource                        ../../Resources/common_resource.robot
Suite Setup						Open Browser To Login Page
Suite Teardown                  Close Browser

*** Test Cases ***
Valid Login
    Login						${VALID USER}                ${VALID PASSWORD}
    Logout
    
Invalid Login
    [Template]                  Login
    invalid                     ${VALID PASSWORD}
	${VALID USER}               invalid
	invalid                     invalid
	${EMPTY}                    ${VALID PASSWORD}
	${VALID USER}               ${EMPTY}
	${EMPTY}                    ${EMPTY}        