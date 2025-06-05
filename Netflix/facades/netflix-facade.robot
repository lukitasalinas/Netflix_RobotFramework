*** Settings ***
Resource       ../../netflix/configuration/configuration-dev.robot


*** Variables *** 
${button-Registration}  css=*[href="/user/registration"]


*** Keywords ***
I am in netflix page
    Open Browser   ${URL_netflix}  chrome
    Maximize Browser Window

Print title of netflix home
  ${title}=  Get Title
  Log To Console  ${title}

The registration option was selected
    click element  ${button-Registration}    

I fill the email as Admin
    Wait Until Element is Visible   ${email}  30
    Input text   ${email}    ${EMAIL_ADMIN}
  
I fill the password
    Wait Until Element is Visible   ${password}  30
    Input text   ${password}    ${PASS_ADMIN}


