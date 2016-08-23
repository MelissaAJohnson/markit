class HomeController < ApplicationController
before_action :authenticate_user!
  
  def index
    @topics = Topic.all.sort_by{ |t| t.title}
  end
end
