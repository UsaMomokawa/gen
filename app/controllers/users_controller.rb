# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :login_required, only: %i(new create)

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to works_path, notice: "アカウントを登録しました"
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to works_path, notice: "アカウント情報を更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to welcome_path, notice: "アカウントを削除しました"
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
