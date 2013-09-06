module ProductsHelper
  def link_to_reservation product
    link_to new_product_reservation_path(product), title: t('.new_reservation') do
      content_tag :span, nil, class: 'glyphicon glyphicon-shopping-cart'
    end
  end
end
