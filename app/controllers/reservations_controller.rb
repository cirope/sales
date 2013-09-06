class ReservationsController < ApplicationController
  include Responder

  before_action :authorize, :set_product
  before_action :set_reservation, only:  [:show, :edit, :update, :destroy]
  before_action :set_title, only: [:index, :show, :new, :edit]
  
  # GET /reservations
  def index
    @reservations = @product ? @product.reservations : Reservation.all
  end

  # GET /reservations/1
  def show
  end

  # GET /products/1/reservations/new
  def new
    @reservation = @product.reservations.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /products/1/reservations
  def create
    @title = t 'reservations.new.title'
    @reservation = @product.reservations.new reservation_params

    create_and_respond
  end

  # PUT/PATCH /reservations/1
  def update
    @title = t 'reservations.edit.title'

    update_and_respond
  end

  # DELETE /reservations/1
  def destroy
    destroy_and_respond
  end

  private

  def set_reservation
    @reservation = Reservation.find params[:id]
    @product = @reservation.product
  end

  def set_product
    @product = Product.find(params[:product_id]) if params[:product_id]
  end

  def set_title
    @title = t '.title'
  end

  def reservation_params
    params.require(:reservation).permit(
      :commerce_id, :loan, :loan_payments, :loan_amount, :advance, :product_id, :address, :deliver_at, :lock_version,
      phones_attributes: [:phone, :description], people_attributes: [:identification, :name]
    )
  end
  alias_method :resource_params, :reservation_params

  def resource
    @reservation
  end
  alias_method :after_create_url, :resource
  alias_method :after_update_url, :resource

  def edit_resource_url
    edit_reservation_url @reservation
  end

  def after_destroy_url
    product_reservations_url @product
  end
end
