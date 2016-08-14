class TopicsController < ApplicationController

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
    @topic.user = current_user
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def create
    @topic = current_user.topics.build(topic_params)

    if @topic.save
        flash[:notice] = "Topic was saved successfully."
        redirect_to @topic
    else
        flash.now[:alert] = "Error creating topic. Please try again."
        render :new
    end
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.title = params[:topic][:title]

    if @topic.save
      flash[:notice] = "Topic successfully updated"
      redirect_to @topic
    else
      flash.now[:alert] = "Error updating topic. Please try again."
      render :edit
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:title)
  end

end
