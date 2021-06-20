*** Settings ***
Documentation            Aqui estarão presentes todas as keywords que compõem os testes de automação web.

Library                  SeleniumLibrary
Library                  String

*** Variables ***
${BROWSER}                chrome
${URL}                    http://automationpractice.com/
${EMAIL}                  felipeehnois1619@robot.com
${FIRST_NAME}             Daniel
${LAST_NAME}              Amaral
${PASSWORD}               felipe@123
${ADDRESS}                Rua Aimorés, 441
${CITY}                   New York
${STATE}                  New York
${ZIPCODE}                00000
${COUNTRY}                United States
${CEL_PHONE}              14997563425
${ADDRESS_F}              My Address





*** Keywords ***
### Setup e Teardown
Abrir Navegador
    # Abrindo o browser
    Open Browser                    browser=${BROWSER}
    # Maximizando a tela
    Maximize Browser Window    

Fechar Navegador
    Close Browser

Acessar a página home do site Automation Practice
    # Acessa a página.
    Go To                ${URL}
    # Verificação se o site foi carregado por xpath e titulo de tela.
    Wait Until Element Is Visible    xpath=//*[@id="block_top_menu"]/ul
    Title Should Be                  My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text        name=search_query        ${PRODUTO}

Clicar no botão pesquisar
    Click Element    name=submit_search
    Sleep            10

Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible        xpath=//*[@id="center_column"]/h1
    Title Should Be                      Search - My Store
    Page Should Contain Image            xpath=//*[@id="center_column"]//*[@src="${URL}img/p/7/7-home_default.jpg"]
    Page Should Contain Link             xpath=//*[@id="center_column"]//*[@class="product-name"][contains(text(),"${PRODUTO}")]

# Desafio 1
Conferir mensagem "No results were found for your search "${PRODUTO}""
    Wait Until Element Is Visible        xpath=//*[@id="center_column"]//*[@class="alert alert-warning"]
    Title Should Be                      Search - My Store
    Page Should Contain Element          xpath=//*[@id="center_column"]//*[@class="alert alert-warning"][contains(text(), "${PRODUTO}" )]         
# Desafio 2
Passar o mouse por cima da categoria "${CATEGORIA}" no menu principal superior de categorias
    Title Should Be    My Store
    Mouse Over         xpath=//*[@id="block_top_menu"]//*[@class="sf-with-ul"][contains(text(), "Women")]    

Clicar na sub-categoria "${SUB_CATEGORIA}"
    Wait Until Element Is Visible    //*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a
    Click Element                    //ul[@class='submenu-container clearfix first-in-line-xs']//ul//li//a[@title='${SUB_CATEGORIA}']
    
Conferir se os produtos da sub-categoria "${SUB_CATEGORIA}" foram mostrados na página
    Title Should Be    ${SUB_CATEGORIA} - My Store
# Desafio 3
Clicar em "Sing in"
    Title Should Be    My Store
    Click Element      xpath=//*[@id="header"]//*[@class="login"]

Informar um e-mail válido
    Title Should Be    Login - My Store
    Input Text        name=email_create       ${EMAIL}

Clicar em "Create an account"
    Click Element    name=SubmitCreate
    Sleep            10

Preencher os dados obrigatórios
    Wait Until Element Is Visible            xpath=//*[@id="noSlide"]/h1
    Input Text                               name=customer_firstname            ${FIRST_NAME}
    Input Text                               name=customer_lastname             ${LAST_NAME}
    Input Password                           name=passwd                        ${PASSWORD}
    Input Text                               name=address1                      ${ADDRESS}
    Input Text                               name=city                          ${CITY}
    Click Element                            xpath=//*[@id="id_state"]
    Wait Until Element Is Visible            xpath=//*//option[contains(text(),'${STATE}')]   
    Click Element                            xpath=//*//option[contains(text(),'${STATE}')]                                        
    Input Text                               name=postcode                      ${ZIPCODE}
    Click Element                            xpath=//*[@id="id_country"]
    Wait Until Element Is Visible            xpath=//*//option[contains(text(),'${COUNTRY}')]   
    Click Element                            xpath=//*//option[contains(text(),'${COUNTRY}')]  
    Input Text                               name=phone_mobile                  ${CEL_PHONE}
    Input Text                               name=alias                         ${ADDRESS_F}   

Submeter cadastro
    Click Element                            name=submitAccount
    Sleep                                    5        

Conferir se o cadastro foi efetuado
    Title Should Be                    My account - My Store
    Wait Until Element Is Visible      xpath=//*[@id="center_column"]/h1
    Page Should Contain Element        xpath=//*[@id="center_column"]//*[@class="page-heading"][contains(text(), "My account" )]