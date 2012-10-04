# coding: utf-8
class UserSessionsController < ApplicationController

  before_filter :authenticate, :only => [:destroy]

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_to root_path
    else
      flash[:notice] = 'El usuario y la contraseña no coinciden'
      render :action => :new
    end
  end

  def destroy
    if session[:created_purchase] == "true"
      Purchase.find(session[:purchase_id]).destroy
      session[:purchase_id] = nil
      session[:created_purchase] = nil
    end

    if session[:created_sale] == "true"
      Sale.find(session[:sale_id]).destroy
      session[:sale_id] = nil
      session[:created_sale] = nil
    end
    current_user_session.destroy
    redirect_to signin_path
  end
end
