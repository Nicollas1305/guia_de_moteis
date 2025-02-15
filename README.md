# 📌 Guia de Motéis  

Este projeto foi desenvolvido como parte de um **processo seletivo**, demonstrando habilidades em **consumo de APIs**, organização com **Clean Architecture**, **gerenciamento de estado** e **testes unitários**.

<p align="center">
  <video src="docs/Gravação de Tela.mp4" controls width="300"></video>
</p>

## 🚀 Funcionalidades  

- Listagem de motéis e suas suítes a partir de uma API externa.
- Interface responsiva e interativa.
- Testes unitários cobrindo os principais cenários.

## 🛠 Tecnologias  

- **Flutter**  
- **Dart**  
- **Http Package**  
- **Mockito** (para testes unitários)  

## ✅ Testes Unitários  

O projeto conta com **testes unitários bem estruturados**, garantindo a confiabilidade da aplicação.  

### 🖥️ **Testes de Widget**  

- `Renderiza corretamente a AppBarWidget.`
- `Alterna entre "Ir agora" e "Ir outro dia" corretamente.`  
- `Renderiza corretamente o FilterScroll e contém itens.`  
- `Lista de filtros pode ser rolada.`  
- `Exibe indicador de carregamento enquanto os motéis são buscados.`  
- `Exibe mensagem quando não há motéis.`  
- `Renderiza motéis e suítes com todas as suas informações corretamente.`  

### 🏗️ **Testes de Modelos**  

- `Deve criar uma instância de Motel corretamente.`  
- `Deve converter JSON para Motel corretamente.`  
- `Deve converter JSON para Suite corretamente.`  
- `Deve converter JSON para Period corretamente.`  
- `Deve converter JSON para ItemCategoria corretamente.`  

### 🔗 **Testes de Serviço (API)**  

- `Deve retornar uma lista de motéis ao receber um HTTP 200.`  
- `Deve lançar exceção quando a resposta tem um formato inesperado.`  
- `Deve lançar exceção ao receber um erro HTTP.`  
- `Deve lançar exceção ao ocorrer um erro de conexão.`  

## 🔎 Como rodar os testes  

Execute os comandos abaixo no terminal para rodar os testes e gerar um relatório de cobertura:  

```sh
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
