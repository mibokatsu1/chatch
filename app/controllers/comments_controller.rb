class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/all_users_chats/#{comment.all_users_chat.id}"
  end
  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :image).merge(user_id: current_user.id, all_users_chat_id: params[:all_users_chat_id])
  end

end
