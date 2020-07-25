class CommentsController < ApplicationController
  before_action :set_all_users_chat
  def new
    @comment = @all_users_chat.comments.new(comment_params)
  end
  def create
    @comment = @all_users_chat.comments.new(comment_params)
    logger.debug @comment.errors.inspect
    @comment.save
    redirect_to all_users_chat_path(@all_users_chat), notice: 'メッセージが送信されました'
  end
  def destroy
    set_all_users_chat
    @comment = Comment.find(params[:id])
    if @comment.user_id == current_user.id
      if @comment.destroy
        redirect_to all_users_chat_path(@all_users_chat), notice: 'コメントを１件削除しました'
      else
        render :show
      end
    else
      redirect_to all_users_chat_path(@all_users_chat), notice: '発言者しか削除できません'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :image).merge(user_id: current_user.id, all_users_chat_id: params[:all_users_chat_id])
  end

  def set_all_users_chat
    @all_users_chat = AllUsersChat.find(params[:all_users_chat_id])
  end

end
