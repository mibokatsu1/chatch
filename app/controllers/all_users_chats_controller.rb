class AllUsersChatsController < ApplicationController
  before_action :set_all_users_chat, only: :show
  def index
    @all_users_chats = All_users_chat.all
  end
  def new
    @all_users_chat = All_users_chat.new
  end
  def create
    All_users_chat.create(all_users_chat_params)
  end
  def show
    @all_users_chat = Comment.new
    @all_users_chats = @all_users_chat.comments.includes(:user)
  end
  def destroy
  end

  private
  def all_users_chat_params
    params.require(:all_users_chat).permit(:image, :content).merge(user_id: current_user.id)
  end

  def set_all_users_chat
    @all_users_chat = All_users_chat.find(params[:id])
  end

end
