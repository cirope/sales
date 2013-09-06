class ProductsController < ApplicationController
  include Responder

  before_action :authorize
  before_action :set_product, only:  [:show, :edit, :update, :destroy]
  before_action :set_title, only: [:index, :show, :new, :edit]
  
  # GET /products
  def index
    @category = Category.find params[:category_id] if params[:category_id]
    @products = @category ? @category.products : Product.all
  end

  # GET /products/1
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  def create
    @title = t 'products.new.title'
    @product = Product.new product_params

    create_and_respond
  end

  # PUT/PATCH /products/1
  def update
    @title = t 'products.edit.title'

    update_and_respond
  end

  # DELETE /products/1
  def destroy
    destroy_and_respond
  end

  private

  def set_product
    @product = Product.find params[:id]
  end

  def set_title
    @title = t '.title'
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :stock, :category_id, :lock_version)
  end
  alias_method :resource_params, :product_params

  def resource
    @product
  end
  alias_method :after_create_url, :resource
  alias_method :after_update_url, :resource

  def edit_resource_url
    edit_product_url @product
  end

  alias_method :after_destroy_url, :products_url
end
