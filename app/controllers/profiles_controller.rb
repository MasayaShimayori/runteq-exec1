class ProfilesController < ApplicationController
  def show; end

  def edit
    @user = current_user
  end

  def update 
    @user = current_user
    if current_user.update(user_params)
      redirect_to profile_path, notice: 'ユーザーを更新しました'
    else
      flash.now[:danger] = 'ユーザーを更新できませんでした'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :avatar_image)
  end
end
