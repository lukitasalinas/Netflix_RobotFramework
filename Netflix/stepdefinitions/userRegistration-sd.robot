*** Settings ***
Resource      ../../netflix/pagesobjects/registration-page.robot
Resource      ../../netflix/configuration/configuration-dev.robot

*** Keywords ***
The data filled correnctly
  I fill the login
  I accept Terms & Conditions
  I fill Password
  I fill Repeat password
  I fill Enter code
  I click on Registration button

#sin Enter code
The data filled incorrectly
  I fill the login
  I accept Terms & Conditions
  I fill Password
  I fill Repeat password
  I click on Registration button

Shows the message of creation not successful
  ${errorMessage}    Get Text    xpath=/html/body/div[1]/main/div/div[1]/div/div[2]/form/fieldset[1]/div[6]/div[2]
  Should Be Equal As Strings    ${errorMessage}    The verification code field cannot be empty.
  Close browser

Shows the mesaje of creation succesfull
  ${responseM1}    Get Text    xpath=/html/body/div[1]/main/div/div/div[2]/h1
  Should Be Equal As Strings    ${responseM1}    Congratulations!
  ${responseM2}    Get Text    xpath=/html/body/div[1]/main/div/div/div[2]/p
  Should Be Equal As Strings    ${responseM2}     Your registration has been successful
  Close browser

I fill the login
  Wait Until Element is Visible   ${loginInput}  30
  Input text   ${loginInput}    ${EMAIL_ADMIN}

I accept Terms & Conditions
  click element  ${termConditionsCheckBox}

I fill Password
  Wait Until Element is Visible   ${passwordInput}  30
  Input text   ${passwordInput}    ${PASSWORD}

I fill Repeat password
  Wait Until Element is Visible   ${repeatPasswordInput}  30
  Input text   ${repeatPasswordInput}    ${PASSWORD}

#Este codigo debe extraterse de la imagen, deberia hacerse con OCR
I fill Enter code
  ${codeImg}    Get Text    ${enterCodeImg}
  Wait Until Element is Visible   ${enterCodeInput}  30
  Input text   ${enterCodeInput}    ${codeImg}

I click on Registration button
  click element  ${registrationButton}    