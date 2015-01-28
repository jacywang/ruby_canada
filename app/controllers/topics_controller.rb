class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :vote]
  before_action :require_user, only: [:new, :create, :edit, :update, :vote]
  before_action :require_creator, only: [:edit, :update]

  def index
    @topics = Topic.all.sort_by { |topic| topic.total_votes }.reverse
  end

  def show
    @comment = Comment.new
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user
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

  def vote
    @vote = Vote.create(voteable: @topic, vote: params[:vote], user: current_user)

    respond_to do |format|
      format.html do 
        if @vote.valid?
          flash[:notice] = "You vote was counted!"
        else
          flash[:error] = "You can only vote once for <strong>#{@topic.title}</strong>".html_safe
        end
        redirect_to :back
      end
      format.js
    end
  end

  private
    def topic_params
      params.require(:topic).permit(:title, :content, category_ids: [])
    end

    def set_topic
      @topic = Topic.find(params[:id])
    end

    def require_creator
      access_denied if current_user != @topic.user  
    end
end
