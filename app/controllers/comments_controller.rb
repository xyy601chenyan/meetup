class CommentsController < ApplicationController
  before_action :authenticate_user!,only:[:create,:destroy]

  def create
    @group= Group.find(params[:group_id])
    @comment = Comment.new(comment_params)
    @comment.group = @group
    @comment.user = current_user
     if @comment.save
    #@comment = @group.comments.create(params[:comment].permit(:review))

    redirect_to group_path(@group)
  else
    redirect_to group_path(@group)
    flash[:alert]='留言内容不能为空'
  end
  end

   private
   def comment_params
     params.require(:comment).permit(:user_id,:group_id,:review)
   end
end
