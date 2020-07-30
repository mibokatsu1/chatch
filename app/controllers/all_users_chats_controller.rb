class AllUsersChatsController < ApplicationController
  before_action :set_all_users_chat, only: [:show, :destroy]

  def index
    @all_users_chats = AllUsersChat.all
  end

  def new
    @all_users_chat = AllUsersChat.new
    @tag_list = Tag.all
    @all_users_chats = AllUsersChat.all
  end

  def create
    # @all_users_chat = AllUsersChat.new
    # AllUsersChat.create(all_users_chat_params)
    @all_users_chat = AllUsersChat.new(all_users_chat_params)
    tag_list = tag_params[:texts].split(/[[:blank:]]+/).select(&:present?)
    # tag_list = tag_params[:text].split(nil)
    # tag_list = params[:all_users_chat][:text].split(nil)
    if @all_users_chat.save
      # binding.pry
      @all_users_chat.save_tags(tag_list)
      
      redirect_to all_users_chat_path(@all_users_chat),  notice: '新しい全体公開チャットが作成されました'
      # redirect_to all_users_chats_path, notice: '新しい全体公開チャットが作成されました'
    else

      render :new, alert: '同じタイトルは登録できません'
    end
    # redirect_to all_users_chat_path(@all_users_chat), notice: '新しい全体公開チャットが作成されました'
  end

  def show
    @all_users_chats = AllUsersChat.all
    @comment = Comment.new
    @comments = @all_users_chat.comments.includes(:user)
    # @all_users_chat_tags = @all_users_chat.tags  
  end

  def destroy
    if @all_users_chat.user_id == current_user.id
      if @all_users_chat.destroy
        redirect_to all_users_chats_path, notice: '全体チャットを１件削除しました'
      else
        render all_users_chats_path, alert: '削除が失敗しました'
      end
    else
      render all_users_chats_path, alert: '作成者しか削除できません'
    end
  end

  def search
    @all_users_chats = AllUsersChat.search(params[:search])
    # binding.pry
    # @tag_list = Tag.all
    # @tag = Tag.find(params[:tag_id])
    # @all_users_chats = @tag.all_users_chats.all  
  end

  private
  def all_users_chat_params
    params.require(:all_users_chat).permit(:name, :image, :user_id).merge(user_id: current_user.id)
  end

  def set_all_users_chat
    @all_users_chat = AllUsersChat.find(params[:id])
  end

  def tag_params
    params.require(:all_users_chat).permit(:texts)
  end

end

