class BookmarksController < ApplicationController
  def show
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build(bookmark_params)

    if @bookmark.save
      flash[:notice] = "Bookmark was saved successfully."
    else
      flash.now[:alert] = "There was an error saving the bookmark. Please try again."
    end

    redirect_to @topic
  end

  def edit
  end
end

private
def bookmark_params
  params.require(:bookmark).permit(:url)
end
