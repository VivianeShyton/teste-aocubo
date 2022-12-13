*** Settings ***
Documentation          Funcionalidades: Testes Automatizados da Página de Imóveis ao Cubo
Resource               ../resource/main.resource
Test Setup             Abrir Navegador
Test Teardown          Fechar Navegador
Library                SeleniumLibrary

*** Test Case ***
Teste 01 - Pesquisa por nome
  Dado  que o usuário esteja na pagina home
  Quando  clicar no botão "Imóveis"
  E  digitar "Imóvel teste automatizado robot" no filtro Pesquisa pelo Nome
  E  clicar no botão "Buscar"
  Então  deve aparecer o imóvel com nome "Imóvel teste automatizado robot"

Teste 02 - Pesquisa por Incorporadora
  Dado  que o usuário esteja na pagina home
  Quando  clicar no botão "Imóveis"
  E  digitar "BKO" no filtro Incorporadora
  Então  deve aparecer o imóvel com nome "Imóvel teste automatizado robot"

Teste 03 - Pesquisa por Estágio da Obra
  Dado  que o usuário esteja na pagina home
  Quando  clicar no botão "Imóveis"
  E  clicar em "Pronto" no filtro Estágio da Obra
  Então  deve aparecer o imóvel com nome "Imóvel teste automatizado robot"

Teste 04 - Pesquisa por cidade e Bairro
  Dado  que o usuário esteja na pagina home
  Quando  clicar no botão "Imóveis"
  E  buscar por "São Paulo" no filtro Cidade ou Bairro
  E  escolher opção Jardim Triana em Bairro
  Então  deve aparecer o imóvel com nome "Imóvel teste automatizado robot"

Teste 05 - Todos os filtros juntos
  Dado  que o usuário esteja na pagina home
  Quando  clicar no botão "Imóveis"
  Quando  digitar "Imóvel teste automatizado robot" no filtro Pesquisa pelo Nome
  E  digitar "BKO" no filtro Incorporadora
  E  clicar em "Pronto" no filtro Estágio da Obra
  E  buscar por "São Paulo" no filtro Cidade ou Bairro
  E  escolher opção Jardim Triana em Bairro
  Então  deve aparecer o imóvel com nome "Imóvel teste automatizado robot"