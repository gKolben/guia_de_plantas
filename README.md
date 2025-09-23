# 🌿 Guia de Plantas

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)

Um aplicativo de guia de cuidados para plantas de apartamento, desenvolvido como um projeto de faculdade para a disciplina de Desenvolvimento Mobile.

## 🎯 Objetivo do Projeto

O objetivo deste app é fornecer um guia rápido e prático para que usuários iniciantes no mundo da jardinagem possam cuidar de suas plantas, com informações sobre rega, luz, substrato e fertilizantes caseiros.

## ✨ Status Atual

O projeto avançou para a **Fase 2**, focada no refinamento da experiência do usuário (UX) e na implementação de persistência de dados para uma navegação mais inteligente, seguindo os guias didáticos da disciplina.

### Funcionalidades Implementadas
- [x] **Tema e UI Customizados:** Implementação de uma paleta de cores centralizada, tema com inspiração iOS e componentes estilizados.
- [x] **Launch Screen Nativa:** Tela de abertura profissional e customizada.
- [x] **Splash Screen Inteligente:** Tela de transição que verifica se o usuário já viu a apresentação.
- [x] **Onboarding Interativo:** Um carrossel de 2 páginas com indicador de progresso (`DotsIndicator`) para guiar o usuário.
- [x] **Persistência de Dados (`SharedPreferences`):** O app "lembra" se o onboarding já foi concluído, otimizando o fluxo para usuários recorrentes.
- [x] **Navegação Estruturada:** Uso de rotas nomeadas para um fluxo de navegação claro e unidirecional.

## 🛠️ Tecnologias Utilizadas

* **Flutter:** Framework principal para o desenvolvimento da interface e lógica.
* **Dart:** Linguagem de programação utilizada pelo Flutter.

## 🚀 Como Executar o Projeto Localmente

Para rodar este projeto no seu computador, siga os passos abaixo:

1.  **Pré-requisitos:**
    * Você precisa ter o [Flutter SDK](https://flutter.dev/docs/get-started/install) instalado e configurado corretamente.
    * Você precisa ter o Git instalado.

2.  **Clone o Repositório:**
    ```bash
    git clone [https://github.com/seu-usuario/guia_de_plantas.git](https://github.com/seu-usuario/guia_de_plantas.git)
    ```
    *(Lembre-se de substituir `seu-usuario` pelo seu nome de usuário do GitHub)*

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