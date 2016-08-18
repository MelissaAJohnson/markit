class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]
  skip_before_action :authenticate_user!


  def create
    # Find the user by using params[:sender]
    @user = User.find_by(email: params[:sender])

    # Check if user is nil, if so, create and save a new user
    if @user.nil?
      @user = User.create(email: params[:sender], password: 'helloworld')
      @user.save
    end

    # Find the topic by using params[:subject]
    @topic = Topic.find_or_create_by(title: params[:subject], user_id: @user.id)
    @bookmark = @topic.bookmarks.find_or_create_by(url: params["body-plain"])

    head 200
 end
end
