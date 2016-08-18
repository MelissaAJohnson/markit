class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    # Find the user by using params[:sender]
    @user = User.find_by(email: params[:sender])

    # Find the topic by using params[:subject]
    @topic = Topic.find_by(title: params[:subject])

    # Assign the url to a variable after retreiving it from params["body-plain"]
    @url = params["body-plain"]

    # Check if user is nil, if so, create and save a new user
    if @user.nil?
      @user = User.create(email: params[:sender], password: 'helloworld')
    end

    # Check if the topic is nil, if so, create and save a new topic
    if @topic.nil?
      @topic = Topic.create(title: params[:subject], user_id: @user)
    end

    # Now that you're sure you have a valid user and topic, build and save a new bookmark
    @bookmark = @topic.bookmarks.create(url: @url)

    # Assuming all went well.
    head 200
 end
end
