module ProductsHelper
  def link_to_reservation product
    link_to new_product_reservation_path(product), title: t('.new_reservation') do
      content_tag :span, nil, class: 'glyphicon glyphicon-shopping-cart'
    end
  end

  def product_reservation_count product
    count = product.reservations.count

    count > 0 && admin? ? link_to(count, product_reservations_path(product)) : count
  end
end
