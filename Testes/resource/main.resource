*** Settings ***
Documentation         Este arquivo contém todos os arquivos de recursos.

# Arquivos resource
Resource    BDDpt-BR.robot
Resource    setup.robot
Resource    teardown.robot
Resource    credentials.resource

# Arquivos steps
Resource    ../steps/resources_test.robot
