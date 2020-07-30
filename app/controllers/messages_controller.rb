class MessagesController < ApplicationController
  before_action :set_group

  def index
    @message = Message.new
    @messages = @group.messages.includes(:user)
  end

  def create
    @message = @group.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.html {redirect_to group_messages_path(@group), notice: 'メッセージが送信されました'}
        format.json
      end
      # redirect_to group_messages_path(@group), notice: 'メッセージが送信されました'
    else
      @messages = @group.messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      redirect_to group_messages_path(@group)
    end
  end

  def destroy
    @message = Message.find(params[:id])
    # if @group.user_id == current_user.id
    #   if @group.destroy
    #     redirect_to root_path, notice: 'グループを１件削除しました'
    #   else
    #     redirect_to group_messages_path(@group), alert: 'グループの削除に失敗しました'
    #   end
    # end
    if (@message.user_id == current_user.id) || (@group.user_id == current_user.id)
      if @message.destroy
        redirect_to group_messages_path(@group), notice: '1つのメッセージが削除しました'
      else
        redirect_to group_messages_path(@group), alert: 'メッセージの削除に失敗しました'
      end
    else
      redirect_to group_messages_path(@group), notice: '作成者はメッセージを削除することは出来ません'
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end