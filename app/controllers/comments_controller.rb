class CommentsController < ApplicationController
  before_action :require_user
  
  def create
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Your comment was created."
      redirect_to topic_path(@topic)
    else
      render 'topics/show'
    end
  end

  def vote
    @comment = Comment.find(params[:id])
    @vote = Vote.create(voteable: @comment, user: current_user, vote: params[:vote])
    if @vote.valid?
      flash[:notice] = "Your vote was counted."
    else
      flash[:error] = "You can only vote once for this comment."
    end
    redirect_to :back
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end 