class TopicsController < ApplicationController

  def index
    @user = current_user
    @topics = Topic.all
    @bookmarks = Bookmark.all
  end

  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
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

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.destroy
      flash[:notice] = "\"#{@topic.title}\" was deleted successfully."
      redirect_to root_url
    else
      flash.now[:alert] = "There was an error deleting the topic."
      render :show
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:title)
  end

end
