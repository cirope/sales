class CategoriesController < ApplicationController
  include Responder

  before_action :authorize_admin
  before_action :set_category, only:  [:show, :edit, :update, :destroy]
  before_action :set_title, only: [:index, :show, :new, :edit]
  
  # GET /categories
  def index
    @categories = Category.all
  end

  # GET /categories/1
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  def create
    @title = t 'categories.new.title'
    @category = Category.new category_params

    create_and_respond
  end

  # PUT/PATCH /categories/1
  def update
    @title = t 'categories.edit.title'

    update_and_respond
  end

  # DELETE /categories/1
  def destroy
    destroy_and_respond
  end

  private

  def set_category
    @category = Category.find params[:id]
  end

  def set_title
    @title = t '.title'
  end

  def category_params
    params.require(:category).permit(:name, :lock_version)
  end
  alias_method :resource_params, :category_params

  def resource
    @category
  end
  alias_method :after_create_url, :resource
  alias_method :after_update_url, :resource

  def edit_resource_url
    edit_category_url @category
  end

  alias_method :after_destroy_url, :categories_url
end
