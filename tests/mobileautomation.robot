*** Settings ***
Documentation        Aqui estarão todos os testes mobile do curso.

Resource    ../Resources/keywords/kws_mobileautomation.robot

Test Setup            
Task Teardown

*** Test Cases ***
Caso de teste 01: Abrindo o youtube
    [Tags]    TESTE1
    Verifique se estou na tela home do youtube
Caso de teste 02: Logar no YouTube
    [Tags]    DESAFIO1
    Abrir o aplicativo
    Logar no aplicativo com a conta x
    Verificar se a conta "Teste Teste" foi logada
    Entrar no menu “Explorar”
    Usar swipe de tela até o 10 item da tela
Caso de teste 03: Usar método Swipe na tela
    [Tags]    DESAFIO2
    Abrir o aplicativo
    Entrar no menu "Explorar"
    Usar o Swipe de tela até o 10º item da tela
    Clicar no video