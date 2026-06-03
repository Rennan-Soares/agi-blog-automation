*** Settings ***
Resource            ../resources/base.resource
Resource            ../pages/home_page.resource

Suite Setup         Abrir Navegador
Suite Teardown      Fechar Navegador
Test Setup          Acessar Página Do Blog
Test Teardown       Run Keyword If Test Failed    Take Screenshot


*** Variables ***
${SEARCH_TERM}                  PIX
${SEARCH_TERM_NO_RESULTS}       Teste técnico abcef


*** Test Cases ***
Pesquisa com resultado (positivo)
    [Documentation]    Valida que a busca retorna resultados para um termo existente.

    Enter Search Term    ${SEARCH_TERM}
    Press Enter
    Should Show Suggestions    css=article[itemscope="itemscope"]
    Results Should Contain Term    ${SEARCH_TERM}

Pesquisa sem resultado (negativo)
    [Documentation]    Valida a exibição da mensagem quando a busca não retorna resultados.

    Enter Search Term    ${SEARCH_TERM_NO_RESULTS}
    Validate Visible Message
    ...    css=div[aria-label="Search results"]
    ...    No results found
    Press Enter
    Validate Visible Message
    ...    css=#main
    ...    Lamentamos, mas nada foi encontrado para sua pesquisa, tente novamente com outras palavras.
