class GroupsController < ApplicationController
  before_action :authenticate_user!, only:[:new,:create,:edit,:update,:destroy]
  before_action :check_permission, only:[:edit,:update,:destroy]
  def index
    @groups = Group.all.order("created_at DESC").paginate(page: params[:page], per_page: 12)
    #Group.find_in_batches( :batch_size => 100) do |groups|
    #  if groups.present?
    #  @groups = groups
    #  @groups = @groups.sort_by(&:"created_at").reverse


    #end
  #end
end

 def show
   @group = Group.find(params[:id])
   @comments = @group.comments.recent.paginate(page: params[:page], per_page: 5)
   @comment = Comment.new
 end

  def new
    @group = Group.new
  end


 def create
   @group = Group.new(group_params)
   @group.user = current_user
   if @group.save
     redirect_to root_path
   else
     render :new
   end
 end

 def edit

 end

  def update

    if @group.update(group_params)
      redirect_to groups_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy

    @group.destroy
    redirect_to groups_path
  end

  private
  def group_params
    params.require(:group).permit(:title,:description,:city)
  end

  def check_permission
    @group = Group.find(params[:id])
    if current_user != @group.user
     redirect_to root_path, alert:"您没有操作权限"
   end
 end
 end
