class SessionsController < ApplicationController
  def new
    redirect_to default_url if current_user

    @title = t('.title')
  end

  def create
    @title = t('sessions.new.title')
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      store_auth_token user
      redirect_to default_url, notice: t('.logged_in')
    else
      flash.now.alert = t('.invalid')
      render 'new'
    end
  end

  def destroy
    cookies.delete :auth_token
    redirect_to root_url, notice: t('.logged_out')
  end

  private

  def default_url
    admin? ? users_url : products_url
  end

  def store_auth_token user
    if params[:remember_me]
      cookies.permanent[:auth_token] = user.auth_token
    else
      cookies[:auth_token] = user.auth_token
    end
  end
end
