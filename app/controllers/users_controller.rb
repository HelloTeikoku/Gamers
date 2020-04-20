class UsersController < ApplicationController
  def index
    @q = User.ransack(params[:q])
    @users = @q.result.where.not(id: current_user.id).page(params[:page])
  end

  def show
    @user = User.find_by(id: params[:id])
  end
end
