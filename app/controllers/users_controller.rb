class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user_messages = current_user.messages
  end
end
