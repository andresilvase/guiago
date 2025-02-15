# <img src="assets/logo.png" alt="Logo" width="64" style="vertical-align: middle;"/> Guia de Motéis - Teste para Desenvolvedor Mobile (Flutter)

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

<img src="assets/home.png" alt="Home" width="200"/>

## 🎥 Demo em Vídeo

Confira o aplicativo em funcionamento:

<div align="center">
  <a href="https://www.youtube.com/watch?v=H6aTh-5lxrE" target="_blank">
    <img src="assets/thumbnail.png" alt="Watch the video" width="560"/>
  </a>
  <p><strong>Guia GO - Demonstração da interface de listagem de motéis com recursos de filtragem, localização e informações detalhadas sobre as acomodações disponíveis.</strong></p>
</div>

## 🏗 Estrutura do Projeto

O projeto segue uma estrutura modularizada para melhor manutenibilidade e escalabilidade:

```
lib/
├── core/
│   ├── domain/              
│   │   ├── motel.dart
│   │   └── suites.dart
│   ├── providers/           
│   │   └── app_providers.dart
│   └── repositories/        
│       └── repository.dart
│
├── presentation/
│   ├── home/               
│   │   ├── view_model/     
│   │   │   ├── home_state.dart
│   │   │   └── home_view_model.dart
│   │   ├── views/          
│   │   │   ├── home.dart
│   │   │   └── motel_list.dart
│   │   └── widgets/        
│   │       ├── departure_time_selector.dart
│   │       ├── dots_indicator.dart
│   │       ├── filter.dart
│   │       ├── header.dart
│   │       ├── highlight_offer_widget.dart
│   │       ├── motel_item.dart
│   │       └── my_local.dart
│   └── theme/              
│       └── app_theme.dart
│
├── main.dart               
└── app.dart               
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
final localStorageProvider = Provider<LocalStorage>((ref) {
  return HiveStorage.instance;
});

final repositoryParamsProvider = Provider<RepositoryParams>((ref) {
  return RepositoryParams(
    localDataSource: LocalDataSourceImpl(localStorage: ref.read(localStorageProvider)),
    remoteDataSource: RemoteDataSourceImpl(apiService: ref.read(apiServiceProvider)),
  );
});

```

## 🧪 Testes e Cobertura

Foram implementados testes unitários para garantir a qualidade do código. O framework **Flutter Test** foi utilizado em conjunto com **Mockito** para mock de dependências.

### 📊 Cobertura de Testes com LCOV - 96%

![Cobertura de código](/assets/coverage.png)

Para verificar a cobertura dos testes, utilize o seguinte comando:

```bash
flutter test flutter test --coverage
```

```bash
genhtml -o coverage/html coverage/lcov.info
```

```bash
open coverage/html/index.html
```


## 🛠 Como Executar o Projeto

1. Clone este repositório:
   ```sh
   git clone https://github.com/andresilvase/guiago
   ```
2. Instale as dependências:
   ```sh
   flutter pub get
   ```
3. Execute a aplicação:
   ```sh
   flutter run
   ```
4. Execute build_runner:
   ```sh
   dart run build_runner build
   ```

## 🔗 Repositório no GitHub

A solução completa pode ser encontrada no seguinte repositório:

[**GitHub - Repositório do Projeto**](https://github.com/andresilvase/guiago)

## ✨ Autor

- **André Silva** - [LinkedIn](https://www.linkedin.com/in/andre-mobile-developer/)


