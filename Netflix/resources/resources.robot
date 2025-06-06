*** Settings ***
Documentation     Archivo de recursos central para los tests de Netflix.

Library           SeleniumLibrary

# Rutas relativas a archivos de configuración y funcionalidades
Resource          ../configuration/configuration-qa.robot
Resource          ../facades/facades.robot
Resource          ../pagesobjects/registration-page.robot