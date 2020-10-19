class StaticPagesController < ApplicationController
  skip_before_action :require_login
  def top
    user = User.find_by(params[:id])
    return unless user
    @user = UserDecorator.new(user)
  end
end
