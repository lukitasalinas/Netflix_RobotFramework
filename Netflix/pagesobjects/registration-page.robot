*** Variables ***
# URLs base y específicas para la recuperación
${BASE_URL}                      https://www.netflix.com
${URL_LOGINHELP_IT}              ${BASE_URL}/it/LoginHelp
${URL_RESET_PASSWORD_FAKE}       ${BASE_URL}/reset-password?token=expiredtoken123

# Navegador a utilizar
${BROWSER}                      Chrome

# Emails utilizados en pruebas
${EMAIL_VALID_USER}             agudelosanti19@gmail.com 
${EMAIL_INVALID_USER}           lukitasalinas@hotmail.com

# Textos esperados en respuestas
${EMAIL_SENT_CONFIRMATION}      Controlla la tua email
${EMAIL_GENERIC_RESPONSE_TEXT}  Se l'indirizzo email è registrato
${PASSWORD_RESET_SUCCESS_TEXT}  La tua password è stata aggiornata

# Contraseña para pruebas de restablecimiento exitoso
${NEW_PASSWORD}                 NewPassword123!

# Selectores
${EMAIL_INPUT}                 name=email
${SUBMIT_BUTTON}               xpath=//button[@data-uia="emailMeButton"]
${NEW_PASSWORD_INPUT}          name=newPassword
${CONFIRM_PASSWORD_INPUT}      name=confirmPassword
${RESET_PASSWORD_BUTTON}       xpath=//button[contains(text(), "Save") or contains(text(), "Salva")]
