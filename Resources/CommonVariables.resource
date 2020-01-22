*** Settings ***
Documentation      Common Variables File
...                These are the common data varibles used to test Activity Application

*** Variable ***
# Browsers
${CHROME}          chrome
${FIREFOX}         firefox
${BROWSER}         ${CHROME}

# URLs
${DEV}             https://activity-dev.hikaya.app
${STAGING}         https://activity-staging.hikaya.app
${BASE URL}        ${STAGING}
${ACTIVITY URL}    www.activity.hikaya.io/

# TEST DATA
${FBH NAME}        For Better Humans
${FBH DESC}        All humans should live better lives.
${FBH URL}         https://hikaya.io/fbh/
${FBH LOCATION}    Kenya
${FBH LOGO}        ${CURDIR}\\Assets\\hikaya_logo.png

# Others
${EXEC TIMEOUT}    ${30}
