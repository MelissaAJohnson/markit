class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
  end

  def new
    @topic = Topic.new
  end

  def edit
  end

  def create
  @topic = Topic.new

  if @topic.save
    flash[:notice] = "Topic was saved successfully."
    redirect_to @topic
  else
    flash.now[:alert] = "Error creating topic. Please try again."
    render :new
  end
end
end
