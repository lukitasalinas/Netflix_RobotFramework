*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser    ${URL}    ${BROWSER}
Suite Teardown    Close Browser
Test Setup        Maximize Browser Window

*** Variables ***
${URL}            https://www.netflix.com/it/LoginHelp
${BROWSER}        Chrome
${EMAIL_VALIDO}   agudelosanti19@gmail.com 
${EMAIL_INVALIDO}  lukitasalinas@hotmail.com

*** Test Cases ***
Valid Request with Registered Email - Netflix
    [Documentation]    Given I am a registered user and have entered my correct email, when I request to reset my password, then the system sends me an email with a link valid for 1 hour and usable once.
    Input Text    name=email    ${EMAIL_VALIDO}
    Click Button  xpath=//button[@data-uia="emailMeButton"]
    Sleep        2s
    Wait Until Page Contains    istruzioni per la reimpostazione della password    timeout=20s

Invalid Email Shows Generic Response - Netflix
    [Documentation]    Given I enter an email not registered, when I request password reset, the system shows a generic message without revealing registration.
    Input Text    name=email    ${EMAIL_INVALIDO}
    Click Button  xpath=//button[@data-uia="emailMeButton"]
    Sleep        2s
    Wait Until Page Contains    Se l'indirizzo email è registrato    timeout=20s

#Expired Reset Link - Netflix
#   [Tags]    skip
#    [Documentation]    Given more than 60 minutes have passed since the reset link was generated, when I try to access the reset link, then the system informs me that the link has expired and allows me to request a new one.
#    Open Browser    https://www.netflix.com/reset-password?token=expiredtoken123    ${BROWSER}
#    Wait Until Page Contains Element    xpath=//*[contains(text(), "Il link è scaduto")]    timeout=10s
    #El token=expiredtoken123 es simulado. Netflix puede redirigir automáticamente o mostrar 
    #una vista genérica si el token no es válido. Para pruebas reales, se debe 
    # generar un enlace de restablecimiento válido y luego esperar o modificar manualmente el 
    # token para probar este escenario.
#    Close Browser

#Used Reset Link - Netflix
#    [Tags]    skip
#    [Documentation]    Given a reset link has already been used, when I try to access it again, then the system informs me that the link is no longer valid.
#    Open Browser    https://www.netflix.com/reset-password?token=usedtoken456    ${BROWSER}
#    Wait Until Page Contains Element    xpath=//*[contains(text(), "Il link non è più valido")]    timeout=10s
    # Como antes, el token usedtoken456 debe representar uno que ya fue utilizado. 
    # Este caso usualmente se simula manualmente
#    Close Browser

#Successful Password Reset - Netflix
#    [Tags]    skip
#    [Documentation]    Given I access a valid password reset link, when I submit a new password, then my password is updated and I can log in with it.
#    Open Browser    https://www.netflix.com/reset-password?token=validtoken789    ${BROWSER}
#    Input Password    name=newPassword    NewPassword123!
#    Input Password    name=confirmPassword    NewPassword123!
#    Click Button      xpath=//button[contains(text(), "Save") or contains(text(), "Salva")]
#    Wait Until Page Contains Element    xpath=//*[contains(text(), "La tua password è stata aggiornata")]    timeout=10s
    # Se Necesita tener un enlace de restablecimiento real generado desde Netflix para probar estos
    # casos. Los campos name=newPassword, name=confirmPassword son supuestos. Revisar el DOM real 
    # del formulario de restablecimiento para ajustar los selectores.
#    Close Browser

*** Keywords ***
Open Browser To Netflix Forgot Page
    Open Browser    ${URL}    ${BROWSER}
    Set Selenium Timeout    10s
