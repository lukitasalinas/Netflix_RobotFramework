*** Settings ***
Library         SeleniumLibrary
Resource        ../configuration/configuration-qa.robot

*** Keywords ***
Open Netflix Forgot Password Page
    [Documentation]    Abre la página de ayuda para iniciar sesión en Netflix (versión italiana).
    Open Browser    ${URL_LOGINHELP_IT}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    10s

Submit Valid Email For Reset
    [Documentation]    Envía una solicitud válida de restablecimiento de contraseña con un correo registrado.
    Input Text        ${EMAIL_INPUT}    ${EMAIL_VALID_USER}
    Click Button      ${SUBMIT_BUTTON}

Submit Invalid Email For Reset
    [Documentation]    Envía una solicitud con un correo no registrado.
    Input Text        ${EMAIL_INPUT}    ${EMAIL_INVALID_USER}
    Click Button      ${SUBMIT_BUTTON}

Verify Generic Response Message
    [Documentation]    Verifica que se muestre un mensaje genérico tras solicitud de restablecimiento con correo inválido.
    Wait Until Page Contains Element    xpath=//*[contains(text(), "${EMAIL_GENERIC_RESPONSE_TEXT}")]    timeout=10s

Verify Email Sent Confirmation
    [Documentation]    Verifica que se muestre la confirmación de envío de correo tras solicitud con correo válido.
    Wait Until Page Contains Element    xpath=//*[contains(text(), "${EMAIL_SENT_CONFIRMATION}")]    timeout=10s

Open Expired Reset Link
    [Documentation]    Intenta acceder a un enlace de restablecimiento expirado.
    Go To    ${URL_RESET_PASSWORD_FAKE}
    Wait Until Page Contains Element    xpath=//*[contains(text(), "Il link è scaduto")]    timeout=10s

Open Used Reset Link
    [Documentation]    Intenta acceder a un enlace de restablecimiento ya utilizado.
    Go To    ${BASE_URL}/reset-password?token=usedtoken456
    Wait Until Page Contains Element    xpath=//*[contains(text(), "Il link non è più valido")]    timeout=10s

Submit New Password
    [Documentation]    Envía una nueva contraseña válida mediante enlace de restablecimiento.
    Input Password    ${NEW_PASSWORD_INPUT}    ${NEW_PASSWORD}
    Input Password    ${CONFIRM_PASSWORD_INPUT}    ${NEW_PASSWORD}
    Click Button      ${RESET_PASSWORD_BUTTON}
    Wait Until Page Contains Element    xpath=//*[contains(text(), "${PASSWORD_RESET_SUCCESS_TEXT}")]    timeout=10s
