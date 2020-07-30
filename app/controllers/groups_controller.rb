class GroupsController < ApplicationController
  before_action :set_group, except: [:new, :index, :create]

  def index
    @all_users_chats = AllUsersChat.all.order(created_at: :DESC)
    # @all_users_chats = AllUsersChat.search(params[:keyword])
  end

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    # binding.pry
    if @group.save
      redirect_to group_messages_path(@group), notice: '新しいグループを作成しました'
    else
      render :new
    end
  end

  def edit
    # @group = Group.find(params[:id])
  end

  def update
    # @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to group_messages_path(@group), notice: 'グループを更新しました'
    else
      render :edit
    end
  end

  def destroy
    # binding.pry
    if current_user.id == @group.user_id
      if @group.destroy
        redirect_to root_path, notice: 'グループを１件削除しました'
      else
        render group_messages(@group), alert: 'グループの削除に失敗しました'
      end
    else
      render group_messages(@group), alert: 'グループ作成者しか削除できません'
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: []).merge(user_id: current_user.id)
    # params.require(:group).permit(:name, user_ids: [], user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
