class HomeController < ApplicationController
  def index
    @topics = Topic.all.sort_by{ |t| t.title}
  end
end
