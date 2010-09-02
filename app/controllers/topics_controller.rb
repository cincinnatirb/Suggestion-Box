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
    if (@topic = Topic.find_by_id(params[:id])) &&
        @topic.votes.create
      flash[:message] = "Thanks for voting"
    else
      flash[:message] = "Sorry, couldn't record your vote"
    end
    redirect_to topics_path
  end
end
