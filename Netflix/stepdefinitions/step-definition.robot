*** Settings ***
Library    SeleniumLibrary
Resource   ../configuration/configuration-qa.robot

*** Keywords ***

Open Netflix Forgot Password Page
    [Documentation]    Abre la página de ayuda para recuperación de contraseña (versión italiana).
    Open Browser    ${URL_LOGINHELP_IT}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    10s

Submit Valid Email For Password Reset
    [Documentation]    Envía una solicitud con un correo registrado.
    Input Text    ${EMAIL_INPUT}    ${EMAIL_VALID_USER}
    Click Button  ${SUBMIT_BUTTON}

Submit Invalid Email For Password Reset
    [Documentation]    Envía una solicitud con un correo no registrado.
    Input Text    ${EMAIL_INPUT}    ${EMAIL_INVALID_USER}
    Click Button  ${SUBMIT_BUTTON}

Verify Email Sent Confirmation Message
    [Documentation]    Verifica que se muestre confirmación cuando el correo es válido.
    Wait Until Page Contains Element    xpath=//*[contains(text(), "${EMAIL_SENT_CONFIRMATION}")]    timeout=10s

Verify Generic Message For Invalid Email
    [Documentation]    Verifica mensaje genérico cuando el correo no está registrado.
    Wait Until Page Contains Element    xpath=//*[contains(text(), "${EMAIL_GENERIC_RESPONSE_TEXT}")]    timeout=10s

Access Expired Password Reset Link
    [Tags]    skip
    [Documentation]    Simula el acceso a un link de restablecimiento expirado.
    Go To    ${URL_RESET_PASSWORD_FAKE}
    Wait Until Page Contains Element    xpath=//*[contains(text(), "Il link è scaduto")]    timeout=10s

Access Used Password Reset Link
    [Tags]    skip
    [Documentation]    Simula el acceso a un link de restablecimiento ya utilizado.
    Go To    ${BASE_URL}/reset-password?token=usedtoken456
    Wait Until Page Contains Element    xpath=//*[contains(text(), "Il link non è più valido")]    timeout=10s

Submit New Password Successfully
    [Tags]    skip
    [Documentation]    Envía una nueva contraseña válida en el formulario de restablecimiento.
    Input Password    ${NEW_PASSWORD_INPUT}        ${NEW_PASSWORD}
    Input Password    ${CONFIRM_PASSWORD_INPUT}    ${NEW_PASSWORD}
    Click Button      ${RESET_PASSWORD_BUTTON}
    Wait Until Page Contains Element    xpath=//*[contains(text(), "${PASSWORD_RESET_SUCCESS_TEXT}")]    timeout=10s
