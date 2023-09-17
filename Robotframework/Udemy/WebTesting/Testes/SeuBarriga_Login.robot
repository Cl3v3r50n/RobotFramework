*** Settings ***
Documentation        Suite testa o site do Seu Barriga
...                  Comandline de execução: robot -d ./Results Testes\SeuBarriga_Login.robot

Resource             ../Resources/SeuBarriga_Resources.robot

Test Setup           Abrir o navegador
# Test Teardown        Fechar o navegador

*** Test Cases ***
Cenário 01: Login Válido
    [Documentation]    Validar acesso correto no site Seu Barriga
    [Tags]             Login
    Dado que eu acesse a página principal do site Seu Barriga
    Quando eu informar usuário e senha
    E clicar no botão Entrar
    Então eu vejo a página principal do site

Cenário 02: e-mail Inválido
    [Documentation]    Validar acesso com dados inválidos no site Seu Barriga
    [Tags]             Login com e-mail incorreto
    Dado que eu acesse a página principal do site Seu Barriga com e-mail inválido
    Quando eu clicar no botão Entrar
    Então eu vejo uma mensagem de alerta de dados inválidos

Cenário 03: senha Inválida
    [Documentation]    Validar acesso com dados inválidos no site Seu Barriga
    [Tags]             Login com senha incorreta
    Dado que eu acesse a página principal do site Seu Barriga com senha inválida
    Quando clicar no botão Entrar
    Então vejo uma mensagem de alerta de usuário ou senha inválidos