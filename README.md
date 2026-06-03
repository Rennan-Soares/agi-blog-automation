# 🧪 Agi Blog Automation Test Project

Projeto de automação de testes E2E utilizando Robot Framework com Browser Library (Playwright), executado localmente e em pipeline CI via GitHub Actions.

## 📌 Objetivo

Automatizar cenários de busca no blog do Agi:
- Pesquisa com resultado (positivo)
- Pesquisa sem resultado (negativo)
- Validação de mensagens e termos na tela
- Garantia de execução em ambiente CI (headless)

## 🌐 Aplicação testada
https://blogdoagi.com.br/

## ⚙️ Tecnologias utilizadas
- Robot Framework
- Browser Library (Playwright)
- Python 3.x
- GitHub Actions
- Chromium (headless)

## 📁 Estrutura do projeto

agi-blog-automation/
├── .github/workflows/       # Configurações de CI/CD (GitHub Actions)
│   └── robot-tests.yml      # Workflow para execução automatizada dos testes
├── browser/                 # Binários ou configurações específicas do browser
├── pages/                   # Page Objects / Recursos de mapeamento de elementos
│   └── home_page.resource
├── reports/                 # Armazenamento histórico de relatórios
├── resources/               # Recursos compartilhados e configurações base
│   └── base.resource
├── results/                 # Resultados da última execução (gerado pelo Robot)
│   ├── browser/
│   ├── log.html
│   ├── output.xml
│   ├── playwright-log.txt
│   └── report.html
├── tests/                   # Suítes de testes automatizados (.robot)
│   └── test_search.robot
├── venv/                    # Ambiente virtual Python (ignorado pelo Git)
├── .gitignore               # Arquivos e pastas ignorados pelo controle de versão
├── LICENSE                  # Licença do projeto
├── README.md                # Documentação principal
└── requirements.txt         # Dependências do projeto (Robot Framework, Browser Library, etc.)

## 🚀 Execução local

1️⃣ Clonar o repositório
git clone https://github.com/Rennan-Soares/agi-blog-automation.git
cd agi-blog-automation

2️⃣ Criar ambiente virtual (recomendado)
python -m venv venv

Ativar o ambiente:

Windows
venv\Scripts\activate

Linux / Mac
source venv/bin/activate

3️⃣ Instalar dependências
pip install --upgrade pip
pip install robotframework
pip install robotframework-browser

4️⃣ Inicializar o Browser Library (Playwright)
rfbrowser init

5️⃣ Executar os testes
robot --outputdir reports tests/

6️⃣ Executar testes específicos (opcional)
robot --include smoke --outputdir reports tests/

7️⃣ Visualizar relatório

Após execução:

reports/log.html
reports/report.html
reports/output.xml

Abrir no navegador:

start reports/report.html   # Windows
open reports/report.html    # Mac
xdg-open reports/report.html # Linux

## 📊 Relatórios

reports/log.html
reports/report.html
reports/output.xml

## 🤖 CI - GitHub Actions

Executa testes em modo headless automaticamente.

## 🧠 Padrões

Variables:
- SEARCH_TERM
- SEARCH_TERM_NO_RESULTS
- SEARCH_FIELD
- SEARCH_ICON

Keywords:
- Open Browser
- Go To Blog Page
- Close Browser
- Search Term

