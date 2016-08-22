class UsersController < ApplicationController
  def show
    # populate @user_bookmarks with the user's bookmarks
    @user_bookmarks = current_user.bookmarks
    # @user_bookmarks = @user_bookmarks.all.group_by(&:topic_id)

    # populate @liked_bookmarks with liked bookmarks
    @liked_bookmarks = current_user.liked_bookmarks
  end
end
