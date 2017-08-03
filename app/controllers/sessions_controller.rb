class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      puts 'this is user id', session[:user_id]
      redirect_to :products
    else
      redirect_to '/sessions/new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/sessions/new'
  end
end
