*** Settings ***
Library           SeleniumLibrary
Resource          ./main.resource

*** Variables ***
${BROWSER}        chrome
${URL}            https://portal.dev.cloud.aocubo.com/

*** Keywords ***
Abrir Navegador
  Open Browser      ${URL}    ${BROWSER}    options=add_argument("--disable-popup-blocking"); add_argument("--ignore-certificate-errors")   alias=1
  Set Window Size    1280    960
  Set Selenium Timeout  10s
  Title Should Be  Corretor AoCubo
  Wait Until Element Is Visible  data:testid:home-register-button
  Page Should Contain Element  data:testid:home-register-button
  Click Element    data:testid:accept-cookies-button
  Click Element    //a[contains(text(),'Login')]
  Wait Until Element is visible   name=email
  Page Should Contain Element  data:testid:email-input
  Page Should Contain Element  data:testid:password-input
  Input Text    name=email    ${user.valid}
  Input Text    name=password    ${password.valid}
  Click Button  data:testid:login-button
