class TopicsController < ApplicationController

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    if @topic = Topic.create(params[:topic])
      redirect_to topics_path
    else
      render :new
    end
  end

  def vote
    flash[:message] = "Thanks for voting"
    redirect_to topics_path
  end
end
