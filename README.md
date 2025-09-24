# 🌿 Guia de Plantas

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)

Um aplicativo de guia de cuidados para plantas de apartamento, desenvolvido como um projeto de faculdade para a disciplina de Desenvolvimento Mobile.

## 🎯 Objetivo do Projeto

O objetivo deste app é fornecer um guia rápido e prático para que usuários iniciantes no mundo da jardinagem possam cuidar de suas plantas, com informações sobre rega, luz, substrato e fertilizantes caseiros.

## ✨ Status Atual

O projeto está atualmente na **Fase 1**, que implementa o fluxo inicial do aplicativo, conforme os requisitos da disciplina.

### Funcionalidades Implementadas

- [x] **Launch Screen Nativa:** Tela de abertura profissional com flutter_native_splash.
- [x] **Splash Screen Inteligente:** Decisão de navegação baseada no estado do onboarding com Future.microtask e SharedPreferences.
- [x] **Onboarding Completo:** 4 páginas estratégicas (Welcome, How it Works, Consent, Go to Access) com controles contextuais.
- [x] **DotsIndicator:** Indicador visual de progresso oculto na última página para melhor UX.
- [x] **Controles de Navegação Contextuais:** Botões Pular, Voltar e Avançar com regras de visibilidade inteligentes.
- [x] **Persistência Local:** SharedPreferences para armazenar onboarding_completed e marketing_consent.
- [x] **Página de Consentimento:** Coleta transparente de consentimento para marketing com botão desabilitado até escolha válida.
- [x] **Navegação Estruturada:** Uso de rotas nomeadas para um fluxo de navegação claro e unidirecional.
- [x] **Acessibilidade:** Princípios de desabilitar > esconder para feedback visual adequado.

## 🛠️ Tecnologias Utilizadas

- **Flutter:** Framework principal para o desenvolvimento da interface e lógica.
- **Dart:** Linguagem de programação utilizada pelo Flutter.
- **SharedPreferences:** Para persistência local de dados do usuário.
- **DotsIndicator:** Para indicador visual de progresso no onboarding.
- **flutter_native_splash:** Para tela de splash nativa personalizada.

## 🚀 Como Executar o Projeto Localmente

Para rodar este projeto no seu computador, siga os passos abaixo:

1.  **Pré-requisitos:**

    - Você precisa ter o [Flutter SDK](https://flutter.dev/docs/get-started/install) instalado e configurado corretamente.
    - Você precisa ter o Git instalado.

2.  **Clone o Repositório:**

    ```bash
    git clone [https://github.com/seu-usuario/guia_de_plantas.git](https://github.com/seu-usuario/guia_de_plantas.git)
    ```

    _(Lembre-se de substituir `seu-usuario` pelo seu nome de usuário do GitHub)_

3.  **Acesse a Pasta do Projeto:**

    ```bash
    cd guia_de_plantas
    ```

4.  **Instale as Dependências:**

    ```bash
    flutter pub get
    ```

5.  **Execute o Aplicativo:**
    Certifique-se de que um emulador está rodando ou um dispositivo físico está conectado e então rode:
    ```bash
    flutter run
    ```
