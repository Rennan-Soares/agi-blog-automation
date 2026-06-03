*** Settings ***
Library     Browser


*** Variables ***
${URL}      https://blog.agibank.com.br


*** Keywords ***
Abrir Navegador
    [Documentation]    Abre o navegador Chromium em modo headless para execução dos testes.
    New Browser    chromium    headless=True
    New Context

Acessar Página Do Blog
    [Documentation]    Acessa a página inicial do Blog do Agi.
    New Page    ${URL}

Fechar Navegador
    [Documentation]    Encerra a sessão do navegador e finaliza a execução dos testes.
    Close Browser
