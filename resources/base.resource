*** Settings ***
Library     Browser


*** Variables ***
${URL}      https://blog.agibank.com.br


*** Keywords ***
Abrir Navegador
    New Browser    chromium    headless=False
    New Context

Acessar Blog Do Agi
    New Page    ${URL}

Fechar Navegador
    Close Browser
