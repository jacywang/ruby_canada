class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update]

  def index
    @topics = Topic.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      flash[:notice] = "Your new topic was created!"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit   
  end

  def update
    if @topic.update_attributes(topic_params)
      flash[:notice] = 'Your topic was saved.'
      redirect_to topic_path
    else
      render :edit
    end
  end

  private
    def topic_params
      params.require(:topic).permit(:title, :content, category_ids: [])
    end

    def set_topic
      @topic = Topic.find(params[:id])
    end
end
