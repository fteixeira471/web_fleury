#language: pt
Funcionalidade: Unidades de Atendimento
  Eu como cliente
  Quero consultar as unidades disponíveis
  Para avaliar a unidade que atenda melhor minhas necessidades

  Cenário: Filtrar por Facilidade
    Dado que estou na home do site do Fleury
    E acesso a opção Unidades
    Quando seleciono as 3 primeiras opções do filtro de facilidades
    E clico para visualizar os detalhes da primeira unidade apresentada
    Então visualizo a página com detalhes da unidade
