class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Your comment was created."
      redirect_to topic_path(@topic)
    else
      render 'topics/show'
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end 