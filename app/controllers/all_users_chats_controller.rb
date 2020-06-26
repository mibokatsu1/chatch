class AllUsersChatsController < ApplicationController
  before_action :set_all_users_chat, only: :show
  def index
    @all_users_chats = AllUsersChat.all
  end
  def new
    @all_users_chat = AllUsersChat.new
  end
  def create

    AllUsersChat.create(all_users_chat_params)
  end
  def show
    @comment = Comment.new
    @comments = @all_users_chat.comments.includes(:user)
  end
  def destroy
  end

  private
  def all_users_chat_params
    params.require(:all_users_chat).permit(:name).merge(user_id: current_user.id)
  end

  def set_all_users_chat
    @all_users_chat = AllUsersChat.find(params[:id])
  end

end
