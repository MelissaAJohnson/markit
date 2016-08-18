class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    # Find the user by using params[:sender]
    puts params[:sender]

    # Find the topic by using params[:subject]
    puts params[:subject]

    # Assign the url to a variable after retreiving it from params["body-plain"]
    @url = params["stripped-text"]

    # Check if user is nil, if so, create and save a new user
    if users.count == 0
      User.invite!(email: params[:sender], name: params[:sender])
    else
      @user = users.first

    # Check if the topic is nil, if so, create and save a new topic
      @topic = Topic.find_or_create_by(title: params[:subject], user: @user)
      puts @topic
    end

    # Now that you're sure you have a valid user and topic, build and save a new bookmark
    puts @url
    @bookmark = Bookmark.new(user: @user, topic: @topic, url: @url)
    puts @bookmark
    @bookmark.save

    # Assuming all went well.
    head 200
 end
end
