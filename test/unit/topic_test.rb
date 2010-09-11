require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  should have_many(:votes).dependent(:delete_all)

  should_validate_presence_of :title
  
  context "a topic" do
    setup do
      @topic = Factory(:topic)
    end
    should "have a zero tally" do
      assert_equal 0, @topic.tally
    end
    context "with a vote" do
      setup do
        @topic.votes.create
        @topic.reload
      end
      should "have a tally of 1" do
        assert_equal 1, @topic.tally
      end
    end
  end
end
