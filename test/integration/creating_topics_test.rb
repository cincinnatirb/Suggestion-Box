require 'test_helper'

class CreatingTopicsTest < ActionController::IntegrationTest
  context "When visiting the new topic page" do
    setup do
      visit new_topic_path
    end
    
    should "see 'New Topic'" do
      assert page.has_content?('New Topic')
    end
  end
  
  context "After submitting a topic" do
    setup do
      @topic = Factory.build(:complete_topic)
      
      visit new_topic_path
      fill_in 'Title', :with => @topic.title
      fill_in 'Description', :with => @topic.description
      fill_in 'Suggestor', :with => @topic.suggestor
      click_button 'Create Topic'
    end
    
    should "see the topics index page" do
      assert (page.current_url == topics_url)
    end
      
    should "see the new topic as a link" do
      assert page.has_link?(@topic.title)
    end
    
    should "see the title, description, and suggestor on the show topic page" do
      click_link @topic.title
      assert page.has_content?(@topic.title), "Should show the title"
      assert page.has_content?(@topic.description), "Should show the description"
      assert page.has_content?(@topic.suggestor), "Should show the suggestor"
    end
  end

  context "without a title" do
    setup do
      visit new_topic_path
      click_button "Create Topic"
    end
    should "see an error message" do
      assert page.has_content?("Title can't be blank"), "The page has no errors"
    end
  end
end
