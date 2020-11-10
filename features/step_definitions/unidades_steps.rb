Dado('que estou na home do site do Fleury') do
  # instancia classe da page object Home
  @home = Home.new
  # acessa a url definida em set_url da classe Home
  @home.load
  # valida se a url foi carregada
  @home.loaded?
  # valida se os elementos essenciais definidos
  ## em expected_elements estao presentes na pagina
  expect(@home).to be_all_there
end

Dado('acesso a opção Unidades') do
  # aguarda ate que o elemento correspondente a guia Unidades
  ## esteja visivel na tela (respeita default_max_wait_time definido
  ## no arquivo env.rb)
  @home.wait_until_navbar_unidades_visible
  # clica no elemento correspondente a guia Unidades
  @home.navbar_unidades.click
end

Quando('seleciono as {int} primeiras opções do filtro de facilidades') do |int|
  # instancia classe da page object Unidades
  @unidades = Unidades.new
  # metodo que aguarda ate que o elemento correspondente ao
  ## filtro por facilidades esteja visivel e seleciona
  ## as 'X' primeiras opções do filtro
  @unidades.selecionar_primeiras_opcoes(int)
end

Quando('clico para visualizar os detalhes da primeira unidade apresentada') do
  # aguarda ate que o elemento correspondente ao(s) card(s)
  ## da(s) unidade(s) de atendimento esteja(m) visivel(is)
  @unidades.wait_until_cards_unidade_nome_visible
  # recupera o nome da primeira unidade de atendimento
  @nome_unidade = @unidades.cards_unidade_nome.first.text
  # clica no link Ver Detalhes do primeiro card de unidade de atendimento
  @unidades.cards_unidade_ver_detalhes.first.click
end

Então('visualizo a página com detalhes da unidade') do
  # instancia classe da page object UnidadeDetalhes
  @unidade_detalhes = UnidadeDetalhes.new
  # aguarda ate que o elemento correspondente ao 
  ## carrossel com imagens da unidade esteja visivel 
  @unidade_detalhes.wait_until_svg_carousel_visible
  # compara se o nome recuperado anteriormente
  ## no card da unidade é igual ao exibido na tela
  ## com detalhes da unidade
  expect(@unidade_detalhes.lbl_unidade_nome.text).to eql(@nome_unidade)
end
