class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
        redirect_to products_path
        flash[:notice] = "You're all signed up!"
    else
      render :action => :new # still the create action, rendering the new view
    end
  end


end
