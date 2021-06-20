*** Settings ***
Documentation        Neste arquivo estarão presentes nossos primeiros fluxos
...                  de automação web e seus respectivos cenário automatizados.

Resource    ../Resources/keywords/kws_automation.robot

Test Setup            Abrir Navegador
Test Teardown         Fechar Navegador

*** Test Cases ***
Caso de Teste 01: Pesquisar produto existente
    [Tags]    TESTE1
    Acessar a página home do site Automation Practice
    Digitar o nome do produto "Blouse" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir se o produto "Blouse" foi listado no site

Caso de Teste 02: Pesquisar produto não existente
    [Tags]    DESAFIO1
    Acessar a página home do site Automation Practice
    Digitar o nome do produto "itemNãoExistente" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir mensagem "No results were found for your search "itemNãoExistente""

Caso de Teste 03: Listar Produtos
    [Tags]    DESAFIO2
    Acessar a página home do site Automation Practice
    Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Clicar na sub-categoria "Summer Dresses"
    Conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página

Caso de Teste 04: Adicionar Cliente
    [Tags]    DESAFIO3
    Acessar a página home do site Automation Practice
    Clicar em "Sing in"
    Informar um e-mail válido
    Clicar em "Create an account"
    Preencher os dados obrigatórios
    Submeter cadastro
    Conferir se o cadastro foi efetuado