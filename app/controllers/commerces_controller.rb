class CommercesController < ApplicationController
  include Responder

  before_action :authorize
  before_action :set_commerce, only:  [:show, :edit, :update, :destroy]
  before_action :set_title, only: [:index, :show, :new, :edit]
  
  # GET /commerces
  def index
    @commerces = Commerce.all
  end

  # GET /commerces/1
  def show
  end

  # GET /commerces/new
  def new
    @commerce = Commerce.new
  end

  # GET /commerces/1/edit
  def edit
  end

  # POST /commerces
  def create
    @title = t 'commerces.new.title'
    @commerce = Commerce.new commerce_params

    create_and_respond
  end

  # PUT/PATCH /commerces/1
  def update
    @title = t 'commerces.edit.title'

    update_and_respond
  end

  # DELETE /commerces/1
  def destroy
    destroy_and_respond
  end

  private

  def set_commerce
    @commerce = Commerce.find params[:id]
  end

  def set_title
    @title = t '.title'
  end

  def commerce_params
    params.require(:commerce).permit(:name, :address, :city, :state, :lock_version)
  end
  alias_method :resource_params, :commerce_params

  def resource
    @commerce
  end
  alias_method :after_create_url, :resource
  alias_method :after_update_url, :resource

  def edit_resource_url
    edit_commerce_url @commerce
  end

  alias_method :after_destroy_url, :commerces_url
end
