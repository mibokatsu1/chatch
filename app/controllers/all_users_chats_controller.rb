class AllUsersChatsController < ApplicationController
  before_action :set_all_users_chat, only: :show
  def index
    @all_users_chats = AllUsersChat.all
  end
  def new
    @all_users_chat = AllUsersChat.new
  end
  def create
    # @all_users_chat = AllUsersChat.new
    # AllUsersChat.create(all_users_chat_params)
    @all_users_chat = AllUsersChat.new(all_users_chat_params)
    @all_users_chat.save
    redirect_to all_users_chats_path, notice: '新しい全体シャットが作成されました'
    
    # redirect_to all_users_chat_path(@all_users_chat), notice: '新しい全体シャットが作成されました'
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
