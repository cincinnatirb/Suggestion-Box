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
end
