class Home < SitePrism::Page
  set_url BASE_URL['home']

  element :navbar, 'div[class*="DesktopBottomHeader"]'
  element :navbar_unidades, 'a.unidades'

  expected_elements :navbar
end
