class GroupsController < ApplicationController
  before_action :authenticate_user!, only:[:new,:create,:edit,:update,:destroy]

  def index
    #@groups = Group.all
    Group.find_in_batches( :batch_size => 100) do |groups|
      if groups.present?
      @groups = groups
      @groups = @groups.sort_by(&:"created_at")

    end
  end
end

 def show
   @group = Group.find(params[:id])
 end

  def new
    @group = Group.new
  end


 def create
   @group = Group.new(group_params)
   if @group.save
     redirect_to @group
   else
     render :new
   end
 end

 def edit
   @group = Group.find(params[:id])
 end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to groups_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end

  def group_params
    params.require(:group).permit(:title,:description,:city)
  end
end
