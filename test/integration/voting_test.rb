require 'test_helper'

class VotingTest < ActionDispatch::IntegrationTest

  context "vising the list of suggestions with a suggestion" do
    setup do
      @suggestion = Factory(:topic)
      visit topics_path
    end
    should "have a vote link" do
      assert page.has_css?("a[href='#{vote_topic_path(@suggestion)}']")
    end

    context "voting for the topic" do
      setup do
        within(:css, "#topic_#{@suggestion.id}") do
          click "Vote"
        end
      end
      should "have a message in flash" do
        within(:css, ".flash") do
          assert page.has_content?("Thanks")
        end
      end
      should "respond with success" do
        assert_equal 200, page.status_code
      end
    end
  end
end
