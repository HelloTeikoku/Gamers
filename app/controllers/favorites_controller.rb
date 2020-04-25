class FavoritesController < ApplicationController
  before_action :set_user
  def create
    favoring = current_user.favorite_user(@user)
    if favoring.save
      flash[:success] = 'ユーザーをお気に入りしました'
      redirect_to @user
    else
      flash.now[:alert] = 'ユーザーのお気に入りに失敗しました'
      redirect_to @user
    end
  end

  def destroy
    favoring = current_user.unfavorite(@user)
    if favoring.destroy
      flash[:success] = 'ユーザーのお気に入りを解除しました'
      redirect_to @user
    else
      flash.now[:alert] = 'ユーザーのお気に入りに失敗しました'
      redirect_to @user
    end
  end

  private
  def set_user
    @user = User.find(params[:favorite][:favorite_id])
  end

end
