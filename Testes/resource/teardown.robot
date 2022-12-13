*** Settings ***
Resource             ../resource/main.resource

*** Keywords ***
Fechar Navegador
  Capture Page Screenshot
  Close Browser