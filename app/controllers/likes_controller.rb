class LikesController < ApplicationController

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    if like.save
    else
      flash[:alert] = "Liking failed. Please contact administrator."
    end
    redirect_to @bookmark.topic
  end

  def destroy
    # Get the bookmark from the params
    @bookmark = Bookmark.find(params[:bookmark_id])
    # Find the current user's like with the ID in the params
    like = current_user.likes.find(params[:id])

    if like.destroy
    else
      flash.now[:alert] = "There was an error un-liking that bookmark. Please try again."
    end
    redirect_to @bookmark.topic
  end
end
