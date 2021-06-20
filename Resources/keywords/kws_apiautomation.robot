*** Settings ***
Documentation        Aqui estarão presentes todos os KEYWORDS de testes de API

Library              RequestsLibrary
Library              Collections

*** Variables ***
${BASE_URL}          https://fakerestapi.azurewebsites.net/api/v1/

&{JSON_POST}
...     id=201
...     title=Meu novo Book
...     description=Estamos testando a adição de novos livros
...     pageCount=555   
...     excerpt=Esse livro é bom
...     publishDate=2021-06-18T23:12:06.9777717+00:00


*** Keywords ***
Conectar minha API
    Create Session      fakeAPI     ${BASE_URL}     disable_warnings=${True}
    ${HEADERS}          Create Dictionary       content-type=application/json
    Set Suite Variable  ${HEADERS}

Requisitar todos os livros
    Create Session             fakeAPI    ${BASE_URL}    disable_warnings=${TRUE}
    ${HEADERS}                 Create Dictionary    content-type=application/json
    Set Suite Variable         ${HEADERS}
    ${RESPOSTA}                Get On Session    fakeAPI      Books    expected_status=any
    Log                        ${RESPOSTA.text}
    Set Test Variable          ${RESPOSTA}

Requisitar livro "${ID_LIVRO}"
    Create Session             fakeAPI    ${BASE_URL}    disable_warnings=${TRUE}
    ${HEADERS}                 Create Dictionary    content-type=application/json
    Set Suite Variable         ${HEADERS}
    ${RESPOSTA}                Get On Session    fakeAPI      Books/${ID_LIVRO}   expected_status=any
    Log                        ${RESPOSTA.text}
    Set Test Variable          ${RESPOSTA}
    

Conferir se retorna todos os dados corretos do livro 20
    Dictionary Should Contain Item    ${RESPOSTA.json()}    id            20
    Dictionary Should Contain Item    ${RESPOSTA.json()}    title         Book 20
    Dictionary Should Contain Item    ${RESPOSTA.json()}    pageCount     2000
    Should Not Be Empty               ${RESPOSTA.json()["description"]}  
    Should Not Be Empty               ${RESPOSTA.json()["excerpt"]}
    Should Not Be Empty               ${RESPOSTA.json()["publishDate"]}  

Conferir o status code
    # Valida o codigo de retorno da API
    [Arguments]        ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.status_code}    ${STATUSCODE_DESEJADO}
    
Conferir o reason
    # Valida o reason de retorno da API
    [Arguments]        ${STATUS_REASON}
    Should Be Equal As Strings    ${RESPOSTA.reason}         ${STATUS_REASON}

Conferir se retorna uma lista com "${QTDE_LIVROS}" livros
    # Conta quantos nós de json tem no retorno
    Length Should Be    ${RESPOSTA.json()}    ${QTDE_LIVROS}

#POST
Cadastrar um novo livro
    Set Test Variable            ${JSON_BODY}            ${JSON_POST}
    ${RESPOSTA}                  Post On Session         fakeAPI        Books
    ...                          json=${JSON_BODY}
    ...                          headers=${HEADERS}       expected_status=any
    Log To Console               ${RESPOSTA.text}
    Set Test Variable            ${RESPOSTA}

Conferir se retorna todos os dados cadastrados do livro "${ID_LIVRO}"
    Dictionary Should Contain Item    ${RESPOSTA.json()}    id            ${JSON_POST.id}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    title         ${JSON_POST.title}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    description   ${JSON_POST.description}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    pageCount     ${JSON_POST.pageCount}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    excerpt       ${JSON_POST.excerpt}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    publishDate   ${JSON_POST.publishDate}
