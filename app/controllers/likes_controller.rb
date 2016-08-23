class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: bookmark)
    authorize like

    if !like.save
      flash[:alert] = "Liking failed. Please contact administrator."
    end
    redirect_to :back
  end

  def destroy
    # Get the bookmark from the params
    bookmark = Bookmark.find(params[:bookmark_id])
    # Find the current user's like with the ID in the params
    like = current_user.likes.find(params[:id])
    authorize like

    if !like.destroy
      flash.now[:alert] = "There was an error un-liking that bookmark. Please try again."
    end
    redirect_to :back
  end
end
