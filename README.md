# Lista de Tarefas

Este projeto visa apresentar uma aplicação simples de criação de tarefas. O projeto não apresenta nenhuma integração com bancos 
de dados ou integração com sistemas *IaaS*.

## Objetivo da aplicação:
O objetivo é meramente utilizar o *MobX* para por em prática a forma de gerência de estados proposta pela biblioteca, motivo 
pelo qual não foi integrado nenhum banco de dados.
  
  
De forma simples, a aplicação permite ao usuário **criar** tarefas e **marcar** na aplicação aquelas que já foram concluídas.
  
## Tecnologias usadas:
Dentre as ferramentas usadas para a criação da aplicação, temos:

- Dart (Linguagem de programação)
- Flutter (framework)

Bibliotecas:
* Dependencias:
    - mobx: ^1.1.1
    - flutter_mobx: ^1.1.0
    - email_validator: ^1.0.5
    - regexed_validator: ^1.0.4

* Dependencias de Desenvolvimento:
    - mobx_codegen: ^1.0.3
    - build_runner: ^1.8.0

  
  
## Visão da Aplicação:
  
A aplicação possui as seguintes telas:

###### Telas de Login: password visível / não-visível
<p align="left">
  <img src="readme_photos/1.png" width="250" title="Tela de Login">
  <img src="readme_photos/2.png" width="250" alt="Password não-visível">
  <img src="readme_photos/3.png" width="250" alt="Password visível">
</p> 


###### Tela de criação de tarefas:
<p align="left">
  <img src="readme_photos/4.png" width="250" title="Tela de Iserção de Tarefas">
  <img src="readme_photos/5.png" width="250" alt="Botão de inserir tarefas visível">
  <img src="readme_photos/6.png" width="250" alt="Tarefas concluída/ não-concluída">
</p> 


## Testando a Aplicação
 
  
1. Clone o repositório no seu computador;
2. Abra o projeto e rode em uma IDE;
3. Faça o teste com um email qualquer, validado por 
 uma expressão regular, e uma senha, que contenha pelo menos 
um numero, um carácter especial e pelo menos 8 carácteres.
