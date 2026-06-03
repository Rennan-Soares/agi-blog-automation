*** Settings ***
Library     Browser


*** Variables ***
${SEARCH_ICON}              css=#ast-desktop-header .ast-search-icon
${SEARCH_FIELD_INPUT}       css=input[type="text"][placeholder="Digite sua busca"]
${BASE_URL}                 https://blogdoagi.com.br


*** Keywords ***
Click Search Icon
    [Documentation]     Aguarda o ícone de pesquisa estar visível na tela e clica nele para abrir a busca.

    Wait For Elements State    ${SEARCH_ICON}    visible
    Click    ${SEARCH_ICON}

Enter Search Term
    [Documentation]    Abre a busca e preenche o campo de pesquisa com o termo informado.
    [Arguments]    ${term}

    Click Search Icon
    Wait For Elements State    ${SEARCH_FIELD_INPUT}    visible
    Fill Text    ${SEARCH_FIELD_INPUT}    ${term}

Press Enter
    [Documentation]    Usuário aperta a tecla enter do teclado para fazer a busca

    Press Keys    ${SEARCH_FIELD_INPUT}    Enter
    Wait For Load State    networkidle

Should Show Suggestions
    [Documentation]    Verifica se existe pelo menos um elemento que corresponda ao seletor.
    [Arguments]    ${selector}

    ${count}=    Get Element Count    ${selector}
    Should Be True    ${count} > 0

Results Should Contain Term
    [Documentation]    Verifica se o termo informado está presente na página.
    [Arguments]    ${term}

    ${count}=    Get Element Count    text=${term}
    Should Be True    ${count} > 0

Validate Visible Message
    [Documentation]    Obtém o texto do elemento e valida se ele contém a mensagem esperada.
    [Arguments]    ${selector}    ${message}

    ${validate message}=    Get Text    ${selector}
    Should Contain    ${validate message}    ${message}
