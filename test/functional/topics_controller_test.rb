require 'test_helper'

class TopicsControllerTest < ActionController::TestCase

  context "new topic" do
    setup do
      get :new
    end
    should_respond_with :success
  end

  context "creating a topic" do
    setup do
      @topic_count = Topic.count
      post :create, :topic => { :title => "Some New Topic", :description => ""}
    end
    should_redirect_to("list of topics") { topics_path }
    should "increase the number of topics" do
      assert Topic.count > @topic_count, "#{Topic.count} is not greater than #{@topic_count}"
    end
  end

  context "list of topics" do
    setup do
      Factory(:topic)
      get :index
    end
    should_respond_with :success
  end
end
