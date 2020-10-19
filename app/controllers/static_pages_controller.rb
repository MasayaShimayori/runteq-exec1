class StaticPagesController < ApplicationController
  skip_before_action :require_login
  def top
    user = User.find_by(params[:id])
    if user
      @user = UserDecorator.new(user)
    end
  end
end
