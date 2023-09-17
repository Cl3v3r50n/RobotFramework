*** Settings ***
Documentation        Suite testa a inclusão de dados no site Seu Barriga
...                  Comandline de execução: robot -d ./Results Testes\SeuBarriga_InserirMovimentacao.robot

Resource             ../Resources/SeuBarriga_Resources.robot

Test Setup           Abrir o navegador
# Test Teardown        Fechar o navegador

*** Test Cases ***
Cenário 01: Criar conta
    Dado que eu esteja acessando o site do Seu Barriga
    Quando eu clicar no menu contas 
    E eu selecionar a opção Adicionar
    E eu informar os dados da conta nova
    Então eu vejo a conta criada com sucesso

# Cenário 02: Criar movimentação
#     # Dado que eu tenha uma conta criada
#     # Quando eu clicar no menu Criar Movimentação
#     # E eu informar os dados da Movimentação
#     # E eu clicar no botão Salvar
#     # Então eu vejo a movimentação criada