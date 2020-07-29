class MessagesController < ApplicationController
  before_action :set_group

  def index
    @message = Message.new
    @messages = @group.messages.includes(:user)
  end

  def create
    @message = @group.messages.new(message_params)
    if @message.save
      redirect_to group_messages_path(@group), notice: 'メッセージが送信されました'
    else
      @messages = @group.messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  def destroy
    @message = Message.find(params[:id])
    if (@message.user_id == current_user.id) || (@group.user_id == current_user.id)
      if @message.destroy
        redirect_to group_messages_path(@group), notice: '1つのメッセージが削除しました'
      else
        render :index, alert: 'メッセージの削除に失敗しました'
      end
    else
      render :index, notice: '作成者はメッセージを削除することは出来ません'
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