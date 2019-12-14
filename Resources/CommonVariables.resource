*** Settings ***
Documentation      Common Variables File
...                These are the common data varibles used to test Activity Application

*** Variable ***
# Browsers
${CHROME}          chrome
${FIREFOX}         firefox

# URLs
${BASE URL}        https://activity-dev.hikaya.app
${ACTIVITY URL}    www.activity.hikaya.io/

# TEST DATA
${FBH NAME}        For Better Humans
${FBH DESC}        All humans should live better lives.
${FBH URL}         https://hikaya.io/fbh/
${FBH LOCATION}    Kenya
${FBH LOGO}        ${CURDIR}\\Assets\\fbh_logo.png

# Others
${EXEC TIMEOUT}    ${30}
