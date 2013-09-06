module ProductsHelper
  def link_to_reservation product
    link_to new_product_reservation_path(product), title: t('products.index.new_reservation') do
      content_tag :span, nil, class: 'glyphicon glyphicon-shopping-cart'
    end
  end

  def product_reservation_count product
    count = product.reservations.count

    count > 0 && admin? ? link_to(count, product_reservations_path(product)) : count
  end

  def category_select
    select(
      'product', 'category', categories_options,
      { include_blank: false, selected: selected_path },
      data: { go_to_url: true }, class: 'form-control'
    )
  end

  private

  def categories_options
    options = [[t('products.index.select_all'), products_path]]

    Category.all.each do |category|
      options << [category.to_s, category_products_path(category)]
    end

    options
  end

  def selected_path
    @category ? category_products_path(@category) :  products_path
  end
end
