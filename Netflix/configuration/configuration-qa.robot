*** Settings ***
Documentation     QA Configuration for Netflix Automated Tests

*** Variables ***
${ENV}                          QA
${BASE_URL}                     https://www.netflix.com
${URL_LOGINHELP_IT}             ${BASE_URL}/it/LoginHelp
${URL_RESET_PASSWORD_FAKE}      ${BASE_URL}/reset-password?token=expiredtoken123
${BROWSER}                      Chrome

${EMAIL_VALID_USER}             agudelosanti19@gmail.com 
${EMAIL_INVALID_USER}           lukitasalinas@hotmail.com
${VALID_PASSWORD}               QaPassword123!
${NEW_PASSWORD}                 QaNewPassword456!

${PASSWORD_RESET_SUCCESS_TEXT}  La tua password è stata aggiornata
${EMAIL_GENERIC_RESPONSE_TEXT}  Se l'indirizzo email è registrato
${EMAIL_SENT_CONFIRMATION}      Controlla la tua email