*** Settings ***
Library        SeleniumLibrary
Library        String

*** Variables ***
${URL_BASE}                https://seubarriga.wcaquino.me/login
${BROWSER}                 Firefox  
${CAMINHO}                 //a[contains(.,'Seu Barriga')]
${USUARIO}                 caintmail548@gmail.com
${SENHA}                   Teste@123
${USUARIO_INCORRETO}       caintmail548@gmail.com.br
${SENHA_INCORRETA}         Teste@456


*** Keywords ***
Abrir o navegador
    Open Browser            ${URL_BASE}        ${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

###Cenário 01: Login Válido###
Dado que eu acesse a página principal do site Seu Barriga
    Go To    url=${URL_BASE}
    Wait Until Element Is Visible    locator=${CAMINHO}

Quando eu informar usuário e senha
    Input Text        id=email   text=${USUARIO}
    Sleep    2
    Input Password    id=senha    password=${SENHA}

E clicar no botão Entrar
    Click Button    xpath=//button[@type='submit'][contains(.,'Entrar')]

Então eu vejo a página principal do site
    Wait Until Element Is Visible    xpath=/html/body/div[1]

##Cenário 02: e-mail inválido###
Dado que eu acesse a página principal do site Seu Barriga com e-mail inválido
    Go To    url=${URL_BASE}
    Wait Until Element Is Visible    locator=${CAMINHO}
    Input Text        id=email   text=${USUARIO_INCORRETO}
    Sleep    2
    Input Password    id=senha    password=${SENHA}

Quando eu clicar no botão Entrar
    Click Button    xpath=//button[@type='submit'][contains(.,'Entrar')]

Então eu vejo uma mensagem de alerta de dados inválidos
    Wait Until Element Is Visible    xpath=//div[@class='alert alert-danger'][contains(.,'Problemas com o login do usuário')]

###Cenário 03: Senha Inválida###
Dado que eu acesse a página principal do site Seu Barriga com senha inválida
    Go To    url=${URL_BASE}
    Wait Until Element Is Visible    locator=${CAMINHO} 
    Input Text        id=email   text=${USUARIO}
    Sleep    2
    Input Password    id=senha    password=${SENHA_INCORRETA}

Quando clicar no botão Entrar
    Click Button    xpath=//button[@type='submit'][contains(.,'Entrar')]

Então vejo uma mensagem de alerta de usuário ou senha inválidos
    Wait Until Element Is Visible    xpath=//div[@class='alert alert-danger'][contains(.,'Problemas com o login do usuário')]

###Criação de Conta e inclusão de dados###
Dado que eu esteja acessando o site do Seu Barriga
    Go To    url=${URL_BASE}
    Wait Until Element Is Visible    locator=${CAMINHO}

    Sleep    2
    Input Text        id=email   text=${USUARIO}
    Input Password    id=senha    password=${SENHA}

    Sleep    2
    Click Button    xpath=//button[@type='submit'][contains(.,'Entrar')]

Quando eu clicar no menu contas
    Wait Until Element Is Visible    locator=${CAMINHO}
    Click Element    locator=//a[contains(@class,'dropdown-toggle')]

E eu selecionar a opção Adicionar
    Click Element    locator=//a[contains(.,'Adicionar')]
    Sleep    2

E eu informar os dados da conta nova
    ${NOME_CONTA}        Generate Random String        10        [LETTERS]
    Input Text    id=nome    ${NOME_CONTA}
    Click Button    locator=//button[@type='submit'][contains(.,'Salvar')]
    Log    O nome da conta é: ${NOME_CONTA}

Então eu vejo a conta criada com sucesso
    Wait Until Element Is Visible    locator=//th[contains(.,'Conta')]