*** Settings ***
Documentation    Aqui estão presentes todos os exercicios do Prime Experts
...              focado
Library    String
Library    XML

*** Variables *** ***
# Minha primeira variavel
${NOME}    Daniel Amaral

# Minha primeira variavel do tipo dicionário
&{PESSOA}        
...        nome=Daniel
...        sobrenome=Amaral
...        idade=25
...        sexo=Masculino
...        profissao=Analista de Teste
...        cidade=Tupã

# Minha primeira variavel  do tipo Lista
@{FRUTAS}
...        Banana
...        Maçã
...        uva
...        Goiaba
...        Laranja

*** Test Cases ***
cenario: Imprimir o Dicionário
    Log To Console    ${PESSOA.nome}
    Log To Console    ${PESSOA.idade}

Cenario: Imprimir o exercicio1
    [Tags]            TESTES
    Log To Console    ${PESSOA.nome}
    Log To Console    ${PESSOA.sobrenome}
    Log To Console    ${PESSOA.idade}
    Log To Console    ${PESSOA.sexo}
    Log To Console    ${PESSOA.profissao}
    Log To Console    ${PESSOA.cidade}

Cenario: Imprimir as frutas
    Log To Console    ${FRUTAS[0]}
    Log To Console    ${FRUTAS[1]}
    Log To Console    ${FRUTAS[2]}
    Log To Console    ${FRUTAS[3]}
    Log To Console    ${FRUTAS[4]}

Cenario: Realizar SOMA
    [Tags]    SOMA
    ${RESULTADO}    Somar dois número    10    50
    Log To Console      ${RESULTADO}
Cenario: Teste Somar
    [Tags]    SOMA_2
    ${RESULTADO}    Somar dois número "55" e "44"
    Log To Console    ${RESULTADO}
Cenario: Criando um email com Argumentos
    [Tags]    email
    ${RESULTADO E_MAIL}    Gerar e-mail concatenado    daniel    amaral    24
    Log To Console    ${RESULTADO E_MAIL}

Cenario: Criando um email
    [Tags]    email2
    ${RESULTADO E_MAIL}    Gerar e-mail concatenado "daniel", "amaral", "24"
    Log To Console    ${RESULTADO E_MAIL}
# FOR de inteiros - com keywords
Cenario: Contando de 0 a 9
    [Tags]    CONTAR
    FOR     ${count}    IN RANGE    0    9
        Log To Console    ${count}
    END
# FOR de string - sem keywords    
Cenario: For para imprimir fruta
    [Tags]    FRUTAS
    Imprimir Frutas
Cenario: Contador 0 a 10
    [Tags]    CONTAGEM
    Contador 0 a 10
Cenario: Países
    [Tags]    PAISES
    Imprimir Paises
Cenario: ifs
    [Tags]    ifs
    Imprimir ifs


*** Keywords ***
Somar dois número
    [Arguments]        ${NUM_A}    ${NUM_B}
    ${SOMA}        Evaluate    ${NUM_A}+${NUM_B}
    [Return]       ${SOMA}

Somar dois número "${NUM_A}" e "${NUM_B}"
    ${SOMA}        Evaluate    ${NUM_A}+${NUM_B}
    [Return]       ${SOMA}
    
Gerar e-mail concatenado
    [Arguments]    ${NOME}    ${SOBRENOME}    ${IDADE}
    ${EMAIL}        Catenate    SEPARATOR=_    ${NOME}    ${SOBRENOME}    ${IDADE}@robot.com
    [Return]        ${EMAIL}

Gerar e-mail concatenado "${NOME}", "${SOBRENOME}", "${IDADE}"
    ${EMAIL}        Catenate    SEPARATOR=_    ${NOME}    ${SOBRENOME}    ${IDADE}@robot.com
    [Return]        ${EMAIL}

Contar de 0 a 9
    FOR     ${count}    IN RANGE    0    10
        Log To Console    ${count}
    END

Contador 0 a 10
    FOR    ${count}    IN RANGE   0    10
        Log To Console    Estou no numero: ${count}
        
    END

Imprimir Paises
    @{PAISES}    Create List    Brasil    Argentina    Alemanha    Honduras    Paraguai
    FOR    ${PAIS}    IN    @{PAISES}
        Log To Console    ${PAIS}
    END

Imprimir frutas
    @{FRUTINHAS}    Create List    Morango    Maçã    uva    abacaxi
    FOR    ${FRUTA}    IN     @{FRUTINHAS}
        Log To Console    ${FRUTA}
    END

Imprimir ifs
    FOR    ${count}    IN RANGE   0    10

        IF     ${count}==5
        Log To Console    Estou no numero: ${count}

        ELSE IF    ${count}==8
        Log To Console    Estou no numero: ${count}
        END

    END
    