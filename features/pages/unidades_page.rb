class Unidades < SitePrism::Page
  element :checkbox_unidades, 'div#checkoox-select-facilities'
  elements :checkbox_items, 'div[class*="CheckboxFieldStyled"]'
  elements :cards_unidade_nome, 'h3[class^="typographycomponentstyle"]'
  elements :cards_unidade_ver_detalhes, 'a[id^="button-see-on-map"]'

  def selecionar_primeiras_opcoes(nr_opcoes)
    wait_until_checkbox_unidades_visible
    checkbox_unidades.hover
    checkbox_unidades.click
    (0...nr_opcoes).each do |i|
      selecionar_opcao_filtro(i)
    end
  end

  def selecionar_opcao_filtro(posicao_array)
    checkbox_items[posicao_array].hover
    checkbox_items[posicao_array].click
  end
end
