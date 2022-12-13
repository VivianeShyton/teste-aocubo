*** Settings ***
Resource          ../resource/main.resource

*** Variables ***
${Imovel}    Imóvel teste automatizado robot

*** Keywords ***
que o usuário esteja na pagina home
  Wait Until Element is visible   data:testid:greetings
  Page Should Contain Element    data:testid:property-card-anchor
  Page Should Contain Element  data:testid:greetings

clicar no botão "Imóveis"
  Click Element     //*[@id="__next"]//aside//nav/a[1]
  Wait Until Element is visible   data:testid:properties-counter-span
  Wait Until Element is visible   data:testid:map
  Page Should Contain Element  data:testid:search-by-name

o sistema deverá redirecionar para a página de Imóveis
  Wait Until Element is visible   data:testid:properties-counter-span
  Wait Until Element is visible   data:testid:map
  Page Should Contain Element  data:testid:search-by-name  
  
digitar "Imóvel teste automatizado robot" no filtro Pesquisa pelo Nome
  Input Text    data:testid:search-by-name    ${Imovel}

clicar no botão "Buscar"
  Page Should Contain Button  //button[contains(text(),'BUSCAR')]
  Click Element  //button[contains(text(),'BUSCAR')]

deve aparecer o imóvel com nome "Imóvel teste automatizado robot"
  Wait Until Element is visible  data:testid:properties-counter-span
  Wait Until Element Is Visible  //h3[contains(text(),'${Imovel}')]
  Scroll Element Into View  //h3[contains(text(),'${Imovel}')]
  Page Should Contain Element  data:testid:properties-counter-span
  Page Should Contain Element  //h3[contains(text(),'${Imovel}')]

digitar "BKO" no filtro Incorporadora
  Page Should Contain Element  id=fieldCompany
  Click Element    id=fieldCompany
  Wait Until Element is visible   name=searchCorp
  Input Text    name=searchCorp    BKO
  Click Element    //div[contains(text(),'BKO')]

clicar em "Pronto" no filtro Estágio da Obra
  Click Element    id=fieldFilters
  Page Should Contain Element  id=floatingFilters
  Scroll Element Into View    //*[@id="floatingFilters"]/div/div[3]/label[3]/div
  Click Element    //*[@id="floatingFilters"]/div/div[3]/label[3]/div
  Scroll Element Into View  data:testid:filter-button
  Click Element  data:testid:filter-button

buscar por "São Paulo" no filtro Cidade ou Bairro
  Page Should Contain Element  data:testid:city-or-neighborhood-button
  Click Element  data:testid:city-or-neighborhood-button
  Click Element  data:testid:city-input
  Click Button  //button[contains(text(),'São Paulo - SP')]

escolher opção Jardim Triana em Bairro
  Page Should Contain Element  data:testid:district-input
  Click Element  data:testid:district-input
  Click Button  //button[contains(text(),'Jardim Triana')]