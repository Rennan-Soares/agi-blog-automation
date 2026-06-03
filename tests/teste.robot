*** Settings ***
Resource            ../resources/base.resource
Resource            ../pages/home_page.resource

Suite Setup         Abrir Navegador
Suite Teardown      Fechar Navegador
Test Setup          Acessar Blog Do Agi
Test Teardown       Run Keyword If Test Failed    Take Screenshot


*** Variables ***
${BUSCA_SUCCESS}    PIX
${BUSCA_FAILED}     Teste técnico abcef


*** Test Cases ***
Pesquisa com resultado (positivo)
    [Documentation]    Valida que a busca retorna resultados para um termo existente.

    Enter Search Term    ${BUSCA_SUCCESS}
    Press Enter
    Should Show Suggestions    css=article[itemscope="itemscope"]
    Results Should Contain Term    ${BUSCA_SUCCESS}

Pesquisa sem resultado (negativo)
    [Documentation]    Valida a exibição da mensagem quando a busca não retorna resultados.

    Enter Search Term    ${BUSCA_FAILED}
    Validate Visible Message
    ...    css=div[aria-label="Search results"]
    ...    No results found
    Press Enter
    Validate Visible Message
    ...    css=#main
    ...    Lamentamos, mas nada foi encontrado para sua pesquisa, tente novamente com outras palavras.
