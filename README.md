# Guia de Motéis - Teste para Desenvolvedor Mobile (Flutter)

Bem-vindo(a) ao repositório do desafio técnico para desenvolvedor Flutter! Este projeto implementa a tela de listagem de motéis (aba "Ir Agora") do aplicativo Guia de Motéis GO, seguindo os requisitos estabelecidos no teste.

## 📌 Visão Geral

Este aplicativo foi desenvolvido utilizando **Flutter** e **Dart**, aplicando boas práticas de arquitetura, gerenciamento de estado e testes automatizados. O objetivo é consumir dados de uma API mock e exibir a listagem de motéis de forma organizada e intuitiva.

## 🚀 Tecnologias Utilizadas

- **Flutter** (Framework principal)
- **Dart** (Linguagem de programação)
- **Riverpod** (Gerenciamento de estado)
- **HTTP** (Consumo de API)
- **Flutter Test + Mocktail** (Testes unitários)
- **LCOV** (Cobertura de testes)

## 📸 Capturas de Tela

> *(Adicione aqui imagens da interface da aplicação, mostrando a listagem de motéis.)*

## 🏗 Estrutura do Projeto

O projeto segue uma estrutura modularizada para melhor manutenibilidade e escalabilidade:

```
lib/
│── main.dart                # Ponto de entrada da aplicação
│── core/                    # Configurações globais e utilitários
│── features/
│   ├── motels/              # Módulo principal da listagem de motéis
│   │   ├── data/            # Repositório e modelos de dados
│   │   ├── presentation/    # Widgets e telas
│   │   ├── providers/       # Gerenciamento de estado com Riverpod
│── widgets/                 # Componentes reutilizáveis
```

## 🌐 Consumo de API

O projeto utiliza o pacote **http** para buscar os dados das seguintes APIs mock:

- [https://jsonkeeper.com/b/1IXK](https://jsonkeeper.com/b/1IXK)
- [https://www.npoint.io/docs/e728bb91e0cd56cc0711](https://www.npoint.io/docs/e728bb91e0cd56cc0711)

A resposta dessas APIs é processada e exibida na tela da listagem.

## 🔄 Gerenciamento de Estado

O gerenciamento de estado é feito com **Riverpod**, garantindo:

- Facilidade na injeção de dependências
- Testabilidade aprimorada
- Melhor separação de responsabilidades

Exemplo de provider:

```dart
final motelProvider = FutureProvider<List<Motel>>((ref) async {
  final repository = ref.watch(motelRepositoryProvider);
  return repository.fetchMotels();
});
```

## 🧪 Testes e Cobertura

Foram implementados testes unitários para garantir a qualidade do código. O framework **Flutter Test** foi utilizado em conjunto com **Mocktail** para mock de dependências.

### 📊 Cobertura de Testes com LCOV

Para verificar a cobertura dos testes, utilize o seguinte comando:

```sh
flutter test --coverage
```

E para gerar o relatório legível:

```sh
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

> *(Substitua este trecho caso utilize outra ferramenta para relatório de cobertura.)*

## 🛠 Como Executar o Projeto

1. Clone este repositório:
   ```sh
   git clone <URL_DO_REPOSITORIO>
   ```
2. Navegue até a pasta do projeto:
   ```sh
   cd guia_de_moteis_flutter
   ```
3. Instale as dependências:
   ```sh
   flutter pub get
   ```
4. Execute a aplicação:
   ```sh
   flutter run
   ```

## 🔗 Repositório no GitHub

A solução completa pode ser encontrada no seguinte repositório:

[**GitHub - Repositório do Projeto**](https://github.com/andresilvase/guiago)

## ✨ Autor

- **André Silva** - [LinkedIn](https://www.linkedin.com/in/andre-mobile-developer/)


